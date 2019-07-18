require_relative '../../concerns/random_house.rb'
class Api::V1::HouseholdsController < ApplicationController
  # before_action :authorized

  def index
    @households = Household.all
    render json: @households, include: [:spaces,:containers, :items, :messages, :users]
  end

  def show
    @household = Household.find(params[:id])
    render json: @household, include: [:spaces,:containers,:items, :users, :messages]
  end

  def create
    @household = Household.create(household_params)
    @user_household = UserHousehold.create(user_id: params[:user_id], household_id: @household.id)
    render json: @household
  end

  def join
    @household = Household.find(params[:join][:household_id])
    @user = User.find(params[:join][:user_id])
    if @household.authenticate(params[:join][:password])
      @user_household = UserHousehold.create(join_params)
      render json: @household
    else
      render json: {message: 'Invalid Password'}, status: :unauthorized
    end
  end

  def leave
    @household = Household.find(params[:leave][:household_id])
    @user = User.find(params[:leave][:user_id])
    @user_household = UserHousehold.find_by(user_id:@user.id, household_id:@household.id)
    if @household.authenticate(params[:leave][:password])
      @user_household.destroy
      render json: @household
    else
      render json: {message: 'Invalid Password'}, status: :unauthorized
    end

  end

  def update
    @household = Household.find(params[:id])
    @household.update(name:params[:household][:name], color: params[:household][:color], image:params[:household][:image])
    render json: @household
  end



  private

  def household_params
    params.require(:household).permit(:name, :password, :color, :image)
  end

  def join_params
    params.require(:join).permit(:user_id, :household_id)
  end

end

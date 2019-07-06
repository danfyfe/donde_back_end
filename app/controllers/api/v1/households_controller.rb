require_relative '../../concerns/random_house.rb'
class Api::V1::HouseholdsController < ApplicationController
  # before_action :authorized

  def index
    # byebug
    @households = Household.all
    # @spaces = Spaces.all
    render json: @households, include: [:spaces,:containers, :items, :messages, :users]
  end

  def show
    # byebug
    @household = Household.find(params[:id])
    render json: @household, include: [:spaces,:containers,:items, :users, :messages]
  end

  def create
    # byebug
    @household = Household.create(household_params)
    # @household.update(image:random_house)
    @user_household = UserHousehold.create(user_id: params[:user_id], household_id: @household.id)
    render json: @household
  end

  def join
    @household = Household.find(params[:join][:household_id])
    @user = User.find(params[:join][:user_id])
    # byebug
    if @household.authenticate(params[:join][:password])
      @user_household = UserHousehold.create(join_params)
      render json: @household
    else
      render json: {message: 'Invalid Password'}, status: :unauthorized
    end
  end

  def update
    # byebug
    @household = Household.find(params[:id])
    @household.update(name:params[:household][:name], color: params[:household][:color])
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

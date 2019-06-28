class Api::V1::HouseholdsController < ApplicationController
  # before_action :authorized

  def index
    # byebug
    @households = Household.all
    # @spaces = Spaces.all
    render json: @households, include: [:spaces,:containers, :items]
  end

  def show
    byebug
  end

  def create
    # byebug
    @household = Household.create(household_params)
    @household.update(image:"https://i.imgur.com/GMOhUbb.png")
    @user_household = UserHousehold.create(user_id: params[:user][:id], household_id: @household.id)
    render json: @household
  end



  private

  def household_params
    params.require(:household).permit(:name, :password,:color)
  end

end

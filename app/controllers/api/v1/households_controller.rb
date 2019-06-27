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
    byebug
    @household = Household.create()
  end



  private

  def household_params
    params.require(:household).permit(:name, :password)
  end

end

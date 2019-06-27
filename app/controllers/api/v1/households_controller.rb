class Api::V1::HouseholdsController < ApplicationController
  has_secure_password
  def create
  
    @household = Household.create()

  end



  private

  def household_params
    params.require(:household).permit(:name, :password)
  end

end

class Api::V1::SpacesController < ApplicationController

  def create
    # byebug
    @space = Space.create(space_params)
    render json: @space
  end

  def show
    # byebug
    @space = Space.find(params[:id])
    render json: @space
  end

  private
  def space_params
    params.require(:space).permit(:name,:household_id)
  end

end
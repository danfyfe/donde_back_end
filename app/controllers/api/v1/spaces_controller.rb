class Api::V1::SpacesController < ApplicationController

  def create
    @space = Space.create(space_params)
    render json: @space
  end

  def show
    @space = Space.find(params[:id])
    render json: @space
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    render json: @space, include: [:containers,:items]
  end

  def destroy
    @space = Space.find(params[:id])
    @household = Household.find(params[:household_id])

    if @space.containers.length === 0
      if @household.authenticate(params[:household_password])
        @space.destroy
        render json: @household
      else
        render json: {message: "Incorrect Household Password"}
      end
    else
      render json: {message: "Cannot delete space with containers. Please remove containers before deleting space"}
    end
  end

  private
  def space_params
    params.require(:space).permit(:name,:household_id)
  end

end

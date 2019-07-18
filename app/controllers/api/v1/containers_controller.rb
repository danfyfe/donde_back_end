class Api::V1::ContainersController < ApplicationController

  def create
    @container = Container.create(container_params)
    render json: @container, include: [:items, :space]
  end

  def show
    byebug
  end

  def update
    byebug
  end

  def destroy
    @container = Container.find(params[:container][:container_id])
    @space = @container.space
    @household = Household.find(params[:container][:household_id])

    if @container.items.length === 0
      if @household.authenticate(params[:container][:password])
        @container.destroy
        render json: @space
      else
        render json: {message: "Household Password Incorrect", error: true}, status: :not_acceptable
      end
    else
      render json: {message: "Cannot delete a container thas has items. Please move or delete the items from the container before deleting the container.", error: true}, status: :not_acceptable
    end
  end


private

  def container_params
    params.require(:container).permit(:name,:description,:space_id)
  end

end

class Api::V1::ContainersController < ApplicationController

  def create
    # byebug
    @container = Container.create(container_params)
    render json: @container, include: [:items, :space]
  end



private

  def container_params
    params.require(:container).permit(:name,:description,:space_id)
  end

end

class Api::V1::ItemsController < ApplicationController

def index
  @items = Item.all
  render json: @items, include: [:users, :container, :space]
end

def show
  @item = Item.find(params[:id])
  # byebug
  render json: @item, include: [:users, :container,:space,:household]
end

def create
  @item = Item.create(item_params)
  # byebug
  render json: @item, include: [:users,:container,:space,:household]
end



private
  def item_params
    params.require(:item).permit(:name,:description,:container_id)
  end
end

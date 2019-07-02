class Api::V1::ItemsController < ApplicationController

def index
  @items = Item.all
  render json: @items, include: [:users, :container, :space]
end

def show
  @item = Item.find(params[:id])
  # byebug
  render json: @item
end

private

end

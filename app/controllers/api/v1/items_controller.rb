class Api::V1::ItemsController < ApplicationController

def index
  @items = Item.all
  render json: @items, include: [:users, :container]
end

private

end

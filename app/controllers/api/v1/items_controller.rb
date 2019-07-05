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

def update
  @container = Container.find(params[:item][:container_id])
  @space = Space.find(params[:item][:space_id])
  @item = Item.find(params[:item][:id])
  # byebug

  @container.update(space_id:params[:item][:space_id])
  @item.update(name:params[:item][:name],description:params[:item][:description], container_id:params[:item][:container_id])
  render json: @item, include: [:users,:container,:space,:household]

end

def set_owners
  @item = Item.find(params[:item][:id])

  params[:users].each do |user_id|
    UserItem.create(user_id: user_id, item_id:params[:item][:id])
  end

  # byebug
  render json: @item, include: [:users,:container,:space,:household]
end



private
  def item_params
    params.require(:item).permit(:name,:description,:container_id)
  end
end

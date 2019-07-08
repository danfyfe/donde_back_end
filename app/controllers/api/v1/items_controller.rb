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

  @user = User.find(params[:user_id])

  @household = @item.household
  # byebug
  @message = Message.create(user_id: @user.id, household_id: @household.id, title:"#{@item.name} has been moved!", content:"#{@user.username} has moved #{@item.name} in #{@item.container.name} to #{@item.space.name}")

  render json: @item, include: [:users,:container,:space,:household]

end

def set_owners

  @item = Item.find(params[:item][:id])

  params[:users_ids].each do |user_id|
    UserItem.find_or_create_by(user_id: user_id, item_id:params[:item][:id])
  end



  # byebug
  render json: @item, include: [:users,:container,:space,:household]
end



private
  def item_params
    params.require(:item).permit(:name,:description,:container_id)
  end
end

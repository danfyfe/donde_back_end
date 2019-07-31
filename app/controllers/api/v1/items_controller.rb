class Api::V1::ItemsController < ApplicationController
  require 'twilio-ruby'

def index
  @items = Item.all
  render json: @items, include: [:users, :container, :space]
end

def show
  @item = Item.find(params[:id])
  render json: @item, include: [:users, :container,:space,:household]
end

def create
  @item = Item.create(item_params)
  params[:users_ids].each do |user_id|
    UserItem.find_or_create_by(user_id: user_id, item_id: @item.id)
  end
  render json: @item, include: [:users,:container,:space,:household]
end

def update
  @container = Container.find(params[:item][:container_id])
  @space = Space.find(params[:item][:space_id])
  @item = Item.find(params[:item][:id])

  @container.update(space_id:params[:item][:space_id])

  @item.update(name:params[:item][:name],description:params[:item][:description], container_id:params[:item][:container_id])

  @user = User.find(params[:user_id])

  @household = @item.household

  @message = Message.create(user_id: @user.id, household_id: @household.id, title:"#{@item.name} has been moved!", content:"#{@user.username} has moved #{@item.name}. #{@item.name} is now in #{@item.container.name} in #{@item.space.name}")

  ## below uses Twilio API to send text message informing move of item. This should eventually only text the owners of the item, but for display purposes, will text one number whenever anything is moved ##
  # account_sid = ENV['TWILIO_ACCOUNT_SID']
  # auth_token = ENV['TWILIO_AUTH_TOKEN']

  # @item.users.each do |user|
  #   message = @client.messages.create(
  #     body:"Message from Donde: #{@user.username} has moved #{@item.name}. #{@item.name} is now in #{@item.container.name} in #{@item.space.name}",
  #     from:ENV['TWILIO_FROM_NUMBER'],
  #     to: user.phone_number
  #   )
  # end


## taken out for live version - dont need peoples phone numbers on here - not secure
  # @client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  # message = @client.messages.create(
  #   body:"Message from Donde: #{@user.username} has moved #{@item.name}. #{@item.name} is now in #{@item.container.name} in #{@item.space.name}",
  #   from:ENV['TWILIO_FROM_NUMBER'],
  #   to:ENV['TWILIO_TO_NUMBER']
  # )

  render json: @item, include: [:users,:container,:space,:household]

end

def set_owners
  @item = Item.find(params[:item][:id])

  params[:users_ids].each do |user_id|
    UserItem.find_or_create_by(user_id: user_id, item_id:params[:item][:id])
  end

  render json: @item, include: [:users,:container,:space,:household]
end

def remove_owner
  @item = Item.find(params[:item][:id])
  @user = User.find(params[:user_id])
  @user_item = UserItem.find_by(item_id:@item.id, user_id:@user.id)
  @user_item.destroy
  render json: @item, include: [:users,:containers,:space,:household]
end

def destroy
  @item = Item.find(params[:id])
  @household = @item.household
  @user = User.find(params[:userId])

  if @household.authenticate(params[:householdPassword])
    @message = Message.create(user_id:@user.id, household_id:@household.id, title:"#{@item.name} has been deleted!", content:"#{@user.username} has deleted #{@item.name}! Item description: #{@item.description}")
    @item.destroy
    render json: {message: "#{@item.name} successfully deleted", error: false}, status: :accepted
  else
    render json: {message: "Household Password Incorrect", error: true}, status: :not_acceptable
  end
end



private
  def item_params
    params.require(:item).permit(:name,:description,:container_id)
  end
end

class Api::V1::MessagesController < ApplicationController
  def index
    @all_messages = Message.all
    # @user_messages = @all_messages.where(user_id:1)
    render json: @all_messages, include:[:household, :user]
  end

  def create
    # byebug
    @message = Message.create(message_params)
    render json: @message
  end

  def household
    byebug
  end

  private

  def message_params
    params.require(:message).permit(:title,:content,:user_id,:household_id)
  end

end

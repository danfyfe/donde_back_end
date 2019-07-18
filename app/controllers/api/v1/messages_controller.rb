class Api::V1::MessagesController < ApplicationController
  def index
    @all_messages = Message.all
    render json: @all_messages, include:[:household, :user]
  end

  def create
    @message = Message.create(message_params)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:title,:content,:user_id,:household_id)
  end

end

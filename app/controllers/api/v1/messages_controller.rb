class Api::V1::MessagesController < ApplicationController
  def index
    @all_messages = Message.all
    @user_messages = @all_messages.where(user_id:1)
    render json: @user_messages, include:[:household, :user]
  end
end

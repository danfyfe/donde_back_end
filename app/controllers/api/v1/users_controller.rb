class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    if params[:user][:password] === params[:user][:passwordConfirm]
      @user = User.create(user_params)
      if @user.valid?
        @user.update(image: "https://i.imgur.com/UFAMSqv.png")
        @token = encode_token(user_id:@user.id)
        render json: { user:UserSerializer.new(@user), jwt: @token}, status: :created
      else
        render json: { error: 'failed to create user'}, status: :not_acceptable
      end
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user)}, status: :accepted
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :phone_number)
  end

end

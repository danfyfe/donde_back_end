class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: %i[create]

  def create
    @user = User.find_by(username: user_login_params[:username])
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
    else
      render json: { message: 'Invalid username and/or password'}, status: :unauthorized
    end
  end




  # def login
  #   @user = User.find_by_username(params[:username])
  #   if @user && @user.authenticate(params[:password])
  #     render json: {token:encode_token(@user)}
  #   else
  #     render json: { error: "Wrong username and/or password"}
  #   end
  # end

  private
    def user_login_params
      params.require(:user).permit(:username,:password)
    end
end

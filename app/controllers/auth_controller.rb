class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    # byebug
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # byebug
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      ActionCable.server.broadcast("online_user", {user: @user})
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
    # byebug
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    # byebug
    params.require(:user).permit(:username, :password)
  end
end

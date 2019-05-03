class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :logout]

  def create
    # byebug
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # byebug
      # encode token comes from ApplicationController
      @user.online = true
      @user.save
      # byebug
      token = encode_token({ user_id: @user.id })
      puts "======== PARAMS ARE: #{params} ========"
      user = {username: @user.username, id: @user.id}
      ActionCable.server.broadcast("online_user", {user: user})
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
    # byebug
  end

  def logout
    # byebug
    user = User.find_by(username: params["username"])
    user.online = false
    user.save
    users = User.all.select do |user|
      user.online == true
    end.map do |user| user = {username: user.username, id: user.username} end
    # byebug
    ActionCable.server.broadcast("online_user", {user: user, offline: true})
    render json: users  
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    # byebug
    params.require(:user).permit(:username, :password)
  end
end

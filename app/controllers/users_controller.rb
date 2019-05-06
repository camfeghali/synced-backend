class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :followees, :online_users]
  #
  def index
    @users = User.all
    render json: @users
  end

  # def followees
  #   # byebug
  #   user = User.find_by(username: params["username"])
  #   byebug
  #   followees = user.followees
  #   byebug
  #   render json: followees
  # end

  def online_users
    @users = User.all.select do |user|
      user.online == true
    end.map do |user| user = {username: user.username, id: user.username} end
    # byebug
    render json: @users
  end

  def create
  @user = User.create(user_params)
  # byebug
    if @user.valid?
      # byebug
      @user.online = true
      @user.save
      # byebug
      token = JWT.encode({user_id: @user.id}, "secret")
      user = {username: @user.username, id: @user.id}
      ActionCable.server.broadcast("online_user", {user: user})
      render json: { user: {username: @user.username}, token: token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
  #
  #
  def get_user
    # byebug
    token = request.headers["authorization"]
    id = JWT.decode(token, "secret")[0]["user_id"]
    @user = User.find(id)
    if @user.valid?
      # byebug
      render json: { user: {username: @user.username, followees: @user.followees}}
    end
  end
  #
  # private
  #
  def user_params
      # byebug
      params.require("user").permit(:username, :password)
  end

end

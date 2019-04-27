class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index]
  #
  def index
    @users = User.all
    render json: @users
  end
  #
  def create
  @user = User.create(user_params)
  # byebug
    if @user.valid?
      # byebug
      token = JWT.encode({user_id: @user.id}, "secret")
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
      render json: { user: {username: @user.username}}
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

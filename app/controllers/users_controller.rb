class UsersController < ApplicationController

  def create
    @user = User.create(username: params["username"], password_digest: params["password"])
  end

end

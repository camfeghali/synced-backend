class SongPlaylistsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update]

  def index
    byebug
  end

  def create
    byebug
  end

end

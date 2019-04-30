class PlaylistsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update]

  def index
    #code
    byebug
  end

  def create
    #code
    user = User.find_by(username: params["username"])
    playlist = Playlist.create(user: user, name: params["playlistName"])
    # byebug
    render json: playlist
  end

end

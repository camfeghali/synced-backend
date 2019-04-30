class PlaylistsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update, :destroy]

  def index
    #code
    # byebug
    user = User.find_by(username: params["username"])
    user_playlists = Playlist.where(`user_id = ${user.id}`)
    # byebug
    render json: user_playlists
  end

  def create
    #code
    user = User.find_by(username: params["username"])
    playlist = Playlist.create(user: user, name: params["playlistName"])
    # byebug
    render json: playlist
  end

  def destroy
    # byebug
    playlist = Playlist.find(params["id"])
    playlist.destroy
    render json: playlist
  end

end

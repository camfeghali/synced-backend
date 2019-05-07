class PlaylistsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update, :destroy, :remove_song]



  def index
    user = User.find_by(username: params["username"])
    user_playlists = Playlist.where(`user_id = ${user.id}`)
    render json: user_playlists
  end

  def remove_song
    #code
    join = SongPlaylist.find_by(song_id: params["songId"], playlist_id: params["playlistId"])
    join.destroy
    playlist = Playlist.find(params["playlistId"])
    songs = playlist.songs
    playlists = Playlist.all
    PlaylistChannel.broadcast_to(playlist, songs)
    # byebug
    # join.delete
    render json: playlists
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

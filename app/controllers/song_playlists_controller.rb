class SongPlaylistsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update, :destroy]

  def index
    byebug
  end

  def create
    # byebug
    song = Song.find(params["songId"])
    playlist = Playlist.find_by(name: params["playlistName"])
    song_playlist = SongPlaylist.create(song_id: song.id, playlist_id: playlist.id)
    # byebug
    PlaylistChannel.broadcast_to(playlist, song)
    render json: {song: song, playlist: playlist}
  end

  def destroy
    byebug
    song = Song.find(params["songId"])
    playlist = Playlist.find_by(name: params["playlistName"])
    song_playlist = SongPlaylist.create(song_id: song.id, playlist_id: playlist.id)
    # byebug
    render json: {song: song, playlist: playlist}
  end

end

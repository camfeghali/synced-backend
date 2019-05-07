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
    this_song = {
      id: song.id,
      name: song.name,
      album_id: song.album_id,
      preview_url: song.preview_url,
      image_url: song.image_url,
      artist: song.album.artist.name,
      album: song.album.title
    }
    PlaylistChannel.broadcast_to(playlist, this_song)
    render json: {song: this_song, playlist: playlist}
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

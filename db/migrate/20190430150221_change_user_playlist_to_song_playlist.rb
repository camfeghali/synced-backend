class ChangeUserPlaylistToSongPlaylist < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_playlists, :song_playlists
  end
end

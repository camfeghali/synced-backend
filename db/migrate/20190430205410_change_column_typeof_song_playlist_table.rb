class ChangeColumnTypeofSongPlaylistTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :song_playlists
  end
end

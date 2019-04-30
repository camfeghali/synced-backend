class ChangeColumnTypeofSong < ActiveRecord::Migration[5.2]
  def change
    change_column :song_playlists, :playlist_id, :integer
  end
end

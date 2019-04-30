class ChangeColumnNameInSongPlaylistTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :song_playlists, :user_id, :song_id
  end
end

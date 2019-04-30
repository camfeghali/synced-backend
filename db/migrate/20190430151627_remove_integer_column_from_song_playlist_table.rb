class RemoveIntegerColumnFromSongPlaylistTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :song_playlists, :integer
  end
end

class RemoveSongIdColumnFromPlaylistsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlists, :song_id
  end
end

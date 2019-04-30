class CreateUserPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_playlists do |t|
      t.string :user_id
      t.string :integer
      t.integer :playlist_id

      t.timestamps
    end
  end
end

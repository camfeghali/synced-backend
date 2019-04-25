class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :song_id
      t.float :timestamp

      t.timestamps
    end
  end
end

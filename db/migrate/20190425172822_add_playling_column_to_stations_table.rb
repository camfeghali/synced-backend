class AddPlaylingColumnToStationsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :playing, :boolean, :default => false
  end
end

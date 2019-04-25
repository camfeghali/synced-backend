class AddHostIdColumnToStationsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :host_id, :integer
  end
end

class DropSuppliersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :suppliers
  end
end

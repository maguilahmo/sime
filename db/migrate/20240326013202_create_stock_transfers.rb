class CreateStockTransfers < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_transfers do |t|
      t.references :suply, null: false, foreign_key: true
      t.integer :qty
      t.integer :warehouse_out
      t.integer :warehouse_in
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

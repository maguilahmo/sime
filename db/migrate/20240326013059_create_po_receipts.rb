class CreatePoReceipts < ActiveRecord::Migration[7.1]
  def change
    create_table :po_receipts do |t|
      t.references :purchase_order, null: false, foreign_key: true
      t.references :suply, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :qty
      t.decimal :new_cost
      t.string :proveedor
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

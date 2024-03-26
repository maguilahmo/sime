class CreatePoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :po_items do |t|
      t.references :purchase_order, null: false, foreign_key: true
      t.references :suply, null: false, foreign_key: true
      t.integer :qty_ped
      t.integer :qty_recib
      t.string :proveedor
      t.decimal :cost
      t.integer :status

      t.timestamps
    end
  end
end

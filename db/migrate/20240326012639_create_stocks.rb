class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.references :suply, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :qty
      t.date :last_updated
      t.integer :update_type

      t.timestamps
    end
  end
end

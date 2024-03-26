class CreateSuplies < ActiveRecord::Migration[7.1]
  def change
    create_table :suplies do |t|
      t.string :pn
      t.string :descripcion
      t.string :presentacion
      t.references :budget_item, null: false, foreign_key: true
      t.decimal :costo_u

      t.timestamps
    end
  end
end

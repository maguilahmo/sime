class CreateWarehouses < ActiveRecord::Migration[7.1]
  def change
    create_table :warehouses do |t|
      t.string :nombre
      t.string :tipo
      t.string :ubicacion
      t.string :delegacion

      t.timestamps
    end
  end
end

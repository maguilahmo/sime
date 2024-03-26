class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.string :cct
      t.string :nombre
      t.string :turno
      t.string :nivel
      t.string :subnivel
      t.string :detalle
      t.integer :matricula
      t.integer :docentes
      t.integer :p_de_apoyo
      t.string :calle
      t.string :numero
      t.string :entre_calle
      t.string :y_calle
      t.string :colonia
      t.string :municipio
      t.string :localidad
      t.string :ambito
      t.string :zona_esc
      t.string :sector
      t.float :latitud
      t.float :longitud

      t.timestamps
    end
  end
end

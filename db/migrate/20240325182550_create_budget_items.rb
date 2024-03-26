class CreateBudgetItems < ActiveRecord::Migration[7.1]
  def change
    create_table :budget_items do |t|
      t.integer :partida
      t.string :descripcion
      t.decimal :monto_disp
      t.date :last_updated
      t.integer :update_type

      t.timestamps
    end
  end
end

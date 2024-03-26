class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :clock_num
      t.string :role
      t.string :salary_level
      t.string :delegacion
      t.boolean :compensations
      t.decimal :comp_amount
      t.string :status
      t.decimal :salary
      t.integer :labor

      t.timestamps
    end
  end
end

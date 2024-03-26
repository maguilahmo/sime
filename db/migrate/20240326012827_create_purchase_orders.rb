class CreatePurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_orders do |t|
      t.date :date
      t.references :budget_item, null: false, foreign_key: true
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

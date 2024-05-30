class AddSpentValuesToPurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :purchase_orders, :calc_spent, :decimal
    add_column :purchase_orders, :spent, :decimal
  end
end

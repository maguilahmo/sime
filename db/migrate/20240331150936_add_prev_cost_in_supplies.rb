class AddPrevCostInSupplies < ActiveRecord::Migration[7.1]
  def change
    add_column :suplies, :prev_cost, :decimal, precision: 10
  end
end

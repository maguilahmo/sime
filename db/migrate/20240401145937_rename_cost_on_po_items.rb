class RenameCostOnPoItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :po_items, :cost, :orig_cost
    add_column :po_items, :new_cost, :decimal, precision: 10
  end
end

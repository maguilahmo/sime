class PoReceipt < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :suply
  belongs_to :warehouse
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["purchase_order", "suply", "user", "warehouse"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "new_cost", "proveedor", "purchase_order_id", "qty", "suply_id", "updated_at", "user_id", "warehouse_id"]
  end
  
end

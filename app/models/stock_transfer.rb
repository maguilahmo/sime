class StockTransfer < ApplicationRecord
  belongs_to :suply
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["suply", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "qty", "suply_id", "updated_at", "user_id", "warehouse_in", "warehouse_out"]
  end
  
end

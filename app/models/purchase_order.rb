class PurchaseOrder < ApplicationRecord
  belongs_to :budget_item
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["budget_item", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["budget_item_id", "created_at", "date", "id", "id_value", "status", "updated_at", "user_id"]
  end
  
end

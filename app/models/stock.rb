class Stock < ApplicationRecord
  belongs_to :suply
  belongs_to :warehouse

  enum update_type: [:entrada, :salida, :ajuste, :transferencia]
  after_initialize :set_default_update_type, :if => :new_record?

  def set_default_update_type
    self.update_type ||= :ajuste
  end

  def self.ransackable_associations(auth_object = nil)
    ["suply", "warehouse"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "last_updated", "qty", "suply_id", "update_type", "updated_at", "warehouse_id"]
  end

end

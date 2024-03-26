class Warehouse < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "delegacion", "id", "id_value", "nombre", "tipo", "ubicacion", "updated_at"]
  end
  
end

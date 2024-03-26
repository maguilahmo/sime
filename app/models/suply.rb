class Suply < ApplicationRecord
  belongs_to :budget_item

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "descripcion", "id", "id_value", "last_updated", "monto_disp", "partida", "update_type", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["budget_item"]
  end
end
class Suply < ApplicationRecord
  belongs_to :budget_item
  has_many :stocks

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "descripcion", "id", "id_value", "last_updated", "monto_disp", "partida", "update_type", "updated_at", "prev_cost"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["budget_item"]
  end
end

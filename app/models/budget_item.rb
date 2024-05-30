class BudgetItem < ApplicationRecord
  has_many :suplies
  has_many :purchase_orders
  has_many :po_items, through: :purchase_orders

  enum update_type: [:ministracion, :gasto, :adecuacion, :ampliación]
  after_initialize :set_default_update_type, :if => :new_record?

  def set_default_update_type
    self.update_type ||= :ministracion
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "descripcion", "id", "id_value", "last_updated", "monto_disp", "partida", "update_type", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end

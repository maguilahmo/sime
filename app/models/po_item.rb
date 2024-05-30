class PoItem < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :suply

  enum status: [:creada, :recibida]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :creada
  end

  def self.ransackable_associations(auth_object = nil)
    ["purchase_order", "suply"]
  end

  def ped_total
    suply.costo_u * self.qty_ped
  end

  def spent
    self.new_cost * self.qty_recib
  end
end

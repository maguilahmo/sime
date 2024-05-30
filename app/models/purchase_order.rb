class PurchaseOrder < ApplicationRecord
  belongs_to :budget_item
  belongs_to :user
  has_many :po_items, dependent: :destroy
  accepts_nested_attributes_for :po_items, allow_destroy: true

  enum status: [:creada, :cotizada, :recibida]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :creada
  end

  def self.ransackable_associations(auth_object = nil)
    ["budget_item", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["budget_item_id", "created_at", "date", "status", "updated_at", "user_id"]
  end

  def pre_spent
    self.po_items.sum(:ped_total)
  end

  def total_spent
    self.po_items.sum(:new_cost)
  end

end

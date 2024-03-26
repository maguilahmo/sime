class PoItem < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :suply
end

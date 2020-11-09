class Income < ApplicationRecord
  belongs_to :buyer
  belongs_to :item
  belongs_to :seller

  validates_presence_of :quantity_items
  validates_numericality_of :quantity_items
end

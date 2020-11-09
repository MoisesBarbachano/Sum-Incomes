class Item < ApplicationRecord
  validates_uniqueness_of :description, case_sensitive: true
  validates_presence_of :description, :price
  validates_numericality_of :price

  has_many :income
end

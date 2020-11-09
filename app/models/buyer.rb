class Buyer < ApplicationRecord
  validates_uniqueness_of :name, case_sensitive: true
  validates_presence_of :name

  has_many :income
end

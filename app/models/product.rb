class Product < ApplicationRecord
  has_one :category
  validates :name, presence: true
end

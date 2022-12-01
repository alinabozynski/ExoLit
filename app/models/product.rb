class Product < ApplicationRecord
  belongs_to :category
  validates :name, :details, presence: true
  validates :price, format: { with: /\$\d+\.[0-9][0-9]/,  message: "Acceptable format for 'price' values: $___.{2}" }, presence: true
end

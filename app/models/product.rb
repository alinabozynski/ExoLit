class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :category
  validates :name, :details, presence: true
  validates :price, format: { with: /\$\d+\.[0-9][0-9]/,  message: "Acceptable format for 'price' values: $___.{2}" }, presence: true
end

class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :price, format: { with: /\$\d+\.\d{2}/,  message: "Acceptable format for 'price' and 'on_sale' values: $___.{2}" }, presence: true, unless: ->(product) { product.on_sale.present? }
  validates :on_sale, format: { with: /\$\d+\.\d{2}/, message: "Acceptable format for 'price' and 'on_sale' values: $___.{2}" }, presence: true, unless: ->(product) { product.price.present? }
end

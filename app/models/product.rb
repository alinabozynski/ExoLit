class Product < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true, unless: ->(product) { product.on_sale.present? }
  validates :on_sale, presence: true, unless: ->(product) { product.price.present? }
end

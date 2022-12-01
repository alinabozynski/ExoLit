class Product < ApplicationRecord
  has_one_attached :image

  attr_accessor :delete_image

after_commit :remove_image, on: [:create, :destroy], if: :delete_image

private def remove_image
  Product.image.purge
end

  belongs_to :category
  validates :name, :details, presence: true
  validates :price, format: { with: /\$\d+\.[0-9][0-9]/,  message: "Acceptable format for 'price' values: $___.{2}" }, presence: true
end

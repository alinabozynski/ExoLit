class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fit: [200, 200]
    attachable.variant :showcase, resize_to_fit: [400, 400]
  end

  attr_accessor :delete_image

after_commit :remove_image, on: [:create, :destroy], if: :delete_image

private def remove_image
  Product.image.purge
end

  belongs_to :category
  validates :name, :details, presence: true
  validates :price, format: { with: /\$\d+\.[0-9][0-9]/,  message: "Acceptable format for 'price' values: $___.{2}" }, presence: true
end

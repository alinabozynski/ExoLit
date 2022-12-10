class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :category
  validates :name, :details, presence: true
  validates :price, format: { with: /\$\d+\.\d\d/,  message: "Acceptable format for 'price' values: $____.__" }, presence: true
  validate :price_control

  def price_control
    if price.partition('.').last.length != 2
      errors.add(:price, 'The price must have 2 digits after the decimal.')
    end
  end
end

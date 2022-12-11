class Product < ApplicationRecord
<<<<<<< HEAD
  has_and_belongs_to_many :orders

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fit: [200, 200]
    attachable.variant :showcase, resize_to_fit: [400, 400]
  end
=======
  has_one_attached :image
>>>>>>> f02bc81dbfa94659cde6f5e35e375a5b43e94684

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

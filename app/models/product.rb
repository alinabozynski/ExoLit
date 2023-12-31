class Product < ApplicationRecord
  has_and_belongs_to_many :orders

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_fit: [200, 200]
    attachable.variant :showcase, resize_to_fit: [400, 400]
  end
  has_one_attached :image

  belongs_to :category
  validates :name, :details, presence: true
  validates :price, format: { with: /\$\d+\.\d\d/,  message: "Acceptable format for 'price' values: $____.__" }, presence: true
  validate :price_control
  after_create :add_default_image

  def price_control
    if price.partition('.').last.length != 2
      errors.add(:price, 'The price must have 2 digits after the decimal.')
    end
  end

  def add_default_image
    unless image.attached?
      image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'no_image_available.jpg')),
        filename: 'no_image_available.jpg', content_type: 'image/jpg'
      )
    end
  end
end

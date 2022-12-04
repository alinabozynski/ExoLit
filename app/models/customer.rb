class Customer < ApplicationRecord
  belongs_to :province, optional: true
  validates :username, presence: true
  validates_uniqueness_of :username
  validates :password, confirmation: true, presence: true
  validates :city, presence: true, if: -> {address.present?}
  validates :address, presence: true, if: -> {postal_code.present?}
  validates :postal_code, presence: true, if: -> {province_id.present?}
  validates :province_id, presence: true, if: -> {city.present?}
  validates :postal_code, format: { with: /[A-Za-z]\d[A-Za-z][\s]?\d[A-Za-z]\d/,  message: " must be in the valid Canadian format, 'ANA NAN', where 'A' represents an alphabetic character and 'N' represents a numeric character." }, if: -> {postal_code.present?}
  validate :postal

  def postal
    if postal_code.present?
      if (postal_code.match?(/[\d\w]+\s[\d\w]+/) && postal_code.length != 7) || (postal_code.match?(/\w\d\w\d\w\d/) && postal_code.length != 6)
        errors.add(:postal_code, ' can only contain 6 characters. A space in the middle is acceptable.')
      end
    end
  end
end

class Customer < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :username, presence: true, uniqueness: true
  before_create :encrypt_password
  validates :password, presence: true, if: -> {!password_hash.present?}

  belongs_to :province, optional: true
  validates :city, presence: true, if: -> {address.present?}
  validates :address, presence: true, if: -> {postal_code.present?}
  validates :postal_code, presence: true, if: -> {province_id.present?}
  validates :province_id, presence: true, if: -> {city.present?}
  validates :postal_code, format: { with: /[A-Za-z]\d[A-Za-z][\s]?\d[A-Za-z]\d/,  message: " must be in the valid Canadian format, 'ANA NAN', where 'A' represents an alphabetic character and 'N' represents a numeric character." }, if: -> {postal_code.present?}
  validate :postal

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(username, password)
    custo = Customer.find_by("username = ?", username)
    if custo && custo.password_hash == BCrypt::Engine.hash_secret(password, custo.password_salt)
      custo
    else
      nil
    end
  end

  def postal
    if postal_code.present?
      if (postal_code.match?(/[\d\w]+\s[\d\w]+/) && postal_code.length != 7) || (postal_code.match?(/\w\d\w\d\w\d/) && postal_code.length != 6)
        errors.add(:postal_code, ' can only contain 6 characters. A space in the middle is acceptable.')
      end
    end
  end
end

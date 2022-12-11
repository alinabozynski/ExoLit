class Order < ApplicationRecord
  has_many :products
  has_one :customer

  STATUS_OPTIONS = ['Pending', 'Paid', 'Shipped']
  validates_inclusion_of :status, :in => STATUS_OPTIONS
  validates :total, presence: true, numericality: { greater_than: 0, only_integer: true }
end

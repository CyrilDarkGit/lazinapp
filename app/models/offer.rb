class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, :unit_price, :overview, :location, :currency, presence: true
  validates :overview, length: { minimum: 10, maximum: 1000 }
  validates :currency, inclusion: { within: %w(EUR GBP USD CNY JPY) }
  has_one_attached :photo
end

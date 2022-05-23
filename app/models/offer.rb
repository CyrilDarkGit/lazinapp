class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependant: :destroy
  validates :name, :unit_price, :overview, :location, presence: true
  validates :overview, length: { minimum: 10, maximum: 1000 }
end

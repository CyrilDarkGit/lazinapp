class Offer < ApplicationRecord
  CATEGORIES = %w(Study Culture Sport Family Social Pets Other)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, length: { minimum: 5, maximum: 40 }
  validates :unit_price, :overview, :location, :currency, :category, presence: true
  validates :overview, length: { minimum: 10, maximum: 1000 }
  validates :currency, inclusion: { within: %w(EUR GBP USD CNY JPY) }
  validates :category, inclusion: { within: CATEGORIES }
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

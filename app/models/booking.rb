class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :date, :quantity, presence: true
  validates :quantity, length: { minimum: 1, maximum: 30 }
end

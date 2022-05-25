class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :date, presence: true

   scope :upcoming, -> { where('? <= Date.today', :date) }

end

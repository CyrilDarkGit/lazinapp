class Booking < ApplicationRecord
  STATUSES = ['pending', 'validate', 'decline']
  belongs_to :user
  belongs_to :offer
  validates :date, presence: true
  validates :status, inclusion: { within: STATUSES }
end

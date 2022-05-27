class Booking < ApplicationRecord
  STATUSES = ['pending', 'validate', 'decline']
  belongs_to :user
  belongs_to :offer
  validates :date, presence: true
  validates :status, inclusion: { within: STATUSES }

  scope :pending, -> { where(status: "pending")}
  scope :accepted, -> { where(status: "validate")}
  scope :accepted_or_pending, -> { where.not(status: "decline")}
  scope :decline, -> { where(status: "decline")}
end

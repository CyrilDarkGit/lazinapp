class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :bookings
  validates :email, uniqueness: true
  has_one_attached :photo

  # Renvoie les offers que j'ai booké
  has_many :booked_offers, through: :bookings, source: :offer

  # renvoyer les bookings qui me sont fait
  has_many :rented_offers, through: :offers, source: :bookings
end

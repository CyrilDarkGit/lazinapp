class Booking < ApplicationRecord
  STATUSES = { 'en attente' => 'Votre réservation est en attente de confirmation par le vendeur',
               'validé' => 'Le vendeur a confirmé votre réservation',
               'annulé' => 'Votre réservation est annulée',
               'refusé' => 'Le vendeur a refusé votre demande',
               'passé' => 'Cette transaction est passée' }
  belongs_to :user
  belongs_to :offer
  validates :date, presence: true
  validates :status, inclusion: { within: STATUSES }

end

class Room < ApplicationRecord
  belongs_to :host, class_name: 'User', dependent: :destroy
  has_many :bookings

  validates :beds, presence: true
end

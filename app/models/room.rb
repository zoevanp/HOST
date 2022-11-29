class Room < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :bookings, dependent: :destroy

  validates :beds, presence: true
end

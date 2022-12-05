class Room < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many_attached :room_pictures
  geocoded_by :address

  validates :beds, presence: true
  validates :room_pictures, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end

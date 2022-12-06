class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :refugee, class_name: 'User'
  has_one :host, through: :room
  has_one :review
  has_one :chatroom

  validates :arrival_date, presence: true
  validates :departure_date, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :refugee, class_name: 'User'
  has_one :host, through: :room
end

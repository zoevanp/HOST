class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :refugee, class_name: 'User'
  has_one :host, through: :room
  has_many :reviews

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
end

class Booking < ApplicationRecord
  belongs_to :room, dependent: :delete
  belongs_to :refugee, class_name: 'User', dependent: :delete
  has_one :host, through: :room, dependent: :delete

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
end

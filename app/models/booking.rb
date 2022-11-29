class Booking < ApplicationRecord
  belongs_to :room, dependent: :destroy
  belongs_to :refugee, class_name: 'User', dependent: :destroy
  has_one :host, through: :room, dependent: :destroy

  validates :arrival_date, presence: true
  validates :departure_date, presence: true
end

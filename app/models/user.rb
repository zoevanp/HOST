class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms_as_host, foreign_key: "host_id", class_name: "Room"
  has_many :bookings_as_host, through: :rooms_as_host, source: :bookings
  has_many :bookings_as_refugee, foreign_key: "refugee_id", class_name: "Booking"
  has_many :rooms_as_refugee, through: :bookings_as_refugee, source: :rooms
end

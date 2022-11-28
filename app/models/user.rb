class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = ["host", "refugee"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms_as_host, foreign_key: "host_id", class_name: "Room"
  has_many :bookings_as_host, through: :rooms_as_host, source: :bookings
  has_many :bookings_as_refugee, foreign_key: "refugee_id", class_name: "Booking"
  has_many :rooms_as_refugee, through: :bookings_as_refugee, source: :rooms

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :role, presence: true
  if :role == "host"
    validates :host_id_number, presence: true
  elsif :role == "refugee"
    validates :refugee_id_number, presence: true
  end
end

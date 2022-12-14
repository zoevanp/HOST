class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = ["host", "refugee"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms_as_host, foreign_key: "host_id", class_name: "Room", dependent: :destroy
  has_many :bookings_as_host, through: :rooms_as_host, source: :bookings, dependent: :destroy
  has_many :bookings_as_refugee, foreign_key: "refugee_id", class_name: "Booking", dependent: :destroy
  has_many :rooms_as_refugee, through: :bookings_as_refugee, source: :rooms, dependent: :destroy
  has_many :reviews, through: :bookings_as_refugee

  has_one_attached :profile_picture

  validates :role, presence: true

  def profile_complete?
    return false unless first_name.present? &&
                        last_name.present? &&
                        username.present? && description.present? &&
                        identity_number.present? &&
                        profile_picture.present?

    true
  end
end

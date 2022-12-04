class AddDepartureTimeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :departure_time, :datetime
  end
end

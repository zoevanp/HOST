class RemoveDepartureTimeFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :departure_time, :datetime
  end
end

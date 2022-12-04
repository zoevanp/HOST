class RemoveDepartureDateFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :departure_date, :date
  end
end

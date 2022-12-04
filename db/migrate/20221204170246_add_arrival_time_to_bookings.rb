class AddArrivalTimeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :arrival_time, :datetime
  end
end

class RemoveArrivalTimeFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :arrival_time, :datetime
  end
end

class RemoveArrivalDateFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :arrival_date, :date
  end
end

class AddStatusRefugeeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :status_refugee, :boolean
  end
end

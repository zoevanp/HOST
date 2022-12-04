class AddBedsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :beds, :integer
  end
end

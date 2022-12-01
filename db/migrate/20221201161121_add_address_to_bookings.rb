class AddAddressToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :address, :string
  end
end

class AddAvailabilityToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :availability, :boolean, default: true
  end
end

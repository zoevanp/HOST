class RemoveImageFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :image, :string
  end
end

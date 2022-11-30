class RemoveImageFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :image, :string
  end
end

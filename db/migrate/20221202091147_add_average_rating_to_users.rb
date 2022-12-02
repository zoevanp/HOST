class AddAverageRatingToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :average_rating, :float
  end
end

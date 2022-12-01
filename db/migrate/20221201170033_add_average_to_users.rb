class AddAverageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :average, :integer
  end
end

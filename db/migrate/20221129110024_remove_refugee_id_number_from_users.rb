class RemoveRefugeeIdNumberFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :refugee_id_number, :string
  end
end

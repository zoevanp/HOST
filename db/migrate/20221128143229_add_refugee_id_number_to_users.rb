class AddRefugeeIdNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :refugee_id_number, :string
  end
end

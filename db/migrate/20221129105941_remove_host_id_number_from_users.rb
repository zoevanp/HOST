class RemoveHostIdNumberFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :host_id_number, :string
  end
end

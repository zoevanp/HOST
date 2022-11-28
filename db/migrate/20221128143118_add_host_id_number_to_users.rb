class AddHostIdNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :host_id_number, :string
  end
end

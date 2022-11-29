class AddIdentityNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :identity_number, :string
  end
end

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :beds
      t.references :host, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

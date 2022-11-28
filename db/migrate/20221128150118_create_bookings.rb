class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :arrival_date
      t.date :departure_date
      t.references :room, null: false, foreign_key: true
      t.references :refugee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

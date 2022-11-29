require "faker"

puts "Destroying database..."
puts "Destroying all users..."
User.destroy_all
puts "Destroying all rooms..."
Room.destroy_all
puts "Destroying all bookings..."
Booking.destroy_all
puts "Creating 10 users..."
10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "password",
    role: ["host", "refugee"].sample,
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  puts "Creating user with id #{user.id}"
  if user.role == "host"
    2.times do
      room = Room.create(
        host_id: user.id,
        beds: rand(1..10)
      )
      puts "Creating room with id #{room.id}"
    end
  end
end
puts "Finished "
  # create_table "bookings", force: :cascade do |t|
  #   t.date "arrival_date"
  #   t.date "departure_date"
  #   t.bigint "room_id", null: false
  #   t.bigint "refugee_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["refugee_id"], name: "index_bookings_on_refugee_id"
  #   t.index ["room_id"], name: "index_bookings_on_room_id"
  # end

  # create_table "rooms", force: :cascade do |t|
  #   t.integer "beds"
  #   t.bigint "host_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["host_id"], name: "index_rooms_on_host_id"
  # end

  # create_table "users", force: :cascade do |t|
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "role"
  #   t.string "first_name"
  #   t.string "last_name"
  #   t.string "username"
  #   t.string "image"
  #   t.text "description"
  #   t.string "host_id_number"
  #   t.string "refugee_id_number"
  #   t.index ["email"], name: "index_users_on_email", unique: true
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  # end

desc "This task is called by the Heroku scheduler add-on"
task update_bookings: :environment do
  puts "Updating booking..."
  Booking.update_bookings
  puts "done."
end

desc "This task is called by the Heroku scheduler add-on"
task update_booking: :environment do
  puts "Updating feed..."
  Booking.update_booking
  puts "done."
end

# task :send_reminders => :environment do
  # User.send_reminders
# end

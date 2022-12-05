desc "This task is called by the Heroku scheduler add-on"
task update_bookings: :environment do
  puts "Updating booking..."
  @bookings.update_bookings
  puts "done."
end

desc "This task is called by the Heroku scheduler add-on"
task update_bookings: :production do
  puts "Updating booking..."
  Booking.update_bookings
  puts "done."
end

# task :send_reminders => :environment do
  # User.send_reminders
# end


=begin desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end =end

class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @my_bookings = @bookings.select do |booking|
      booking.host.id == current_user.id || booking.refugee.id == current_user.id
    end
  end

  def show
  end
end

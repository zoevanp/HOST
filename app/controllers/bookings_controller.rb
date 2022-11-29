require 'Date'
class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @my_bookings = @bookings.select do |booking|
      booking.host.id == current_user.id || booking.refugee.id == current_user.id
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.refugee_id = current_user.id
    @rooms = Room.all
    @rooms.each do |room|
      if room.bookings  == []
        @booking.room_id = room.id
        room.availability = false
      elsif (room.bookings.last.departure_date - Date.today).negative?
        room.availability = false
      else
        room.availability = true
        @booking.room_id = room.id
      end
    end
    # @booking.room_id = Booking.where(room_id: nil)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      raise
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date)
  end

end

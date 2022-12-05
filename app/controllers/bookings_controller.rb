require 'date'
class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @my_bookings = @bookings.select do |booking|
      booking.host.id == current_user.id || booking.refugee.id == current_user.id
    end
  end

  def show
    @review = Review.new
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
      elsif (room.bookings.last.departure_date - Date.today).positive?
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
      redirect_to error_page_path
    end
  end

  # every 1.day, at: '6:00 pm' do
  #   runner update_bookings
  # end

  # every 1.minute do # 1.minute 1.day 1.week 1.month 1.year is also supported
  #   # the following tasks are run in parallel (not in sequence)
  #   runner update_bookings
  # end

  def update_bookings
    @bookings = Booking.all
    @my_bookings = @bookings.select do |booking|
    booking.host.id == current_user.id || booking.refugee.id == current_user.id

    Room.all.each do |room|
      room.update(availability: true)
    end

    end
    @bookings_today = Booking.where(arrival_date: Date.today)
    @rooms_available = Room.where(availability: true)
    @bookings_today.each do |booking|
      room_found = find_room(booking, @rooms_available, 0.2)
      if room_found.present? && room_found.availability == true
        booking.update(room: room_found)
        room_found.update(availability: false)
      end
    end
    redirect_to bookings_path
  end

  def find_room(booking, rooms, distance)
    @distance = distance
    while @distance <= 5
      if rooms.near(booking.address, @distance).empty?
        find_room(booking, rooms, @distance + 0.2)
        @distance += 0.2
      else
        result = rooms.near(booking.address, distance).first
        @distance = 6
      end
    end
    result
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date, :beds, :address)
  end

end

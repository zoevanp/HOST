require 'date'
class BookingsController < ApplicationController
  @update_bookings

  def index
    @bookings = Booking.all
    @my_current_bookings = @bookings.select do |booking|
      booking.host.id == current_user.id || booking.refugee_id == current_user.id
    end
    @my_current_bookings = @my_current_bookings.select do |booking|
      (booking.departure_date - Date.today).positive?
    end
    @my_past_bookings = @bookings.select do |booking|
      booking.host.id == current_user.id || booking.refugee_id == current_user.id
    end
    @my_past_bookings = @my_past_bookings.select do |booking|
      (booking.departure_date - Date.today).negative?
    end
  end

  def show
    @review = Review.new
    @booking = Booking.find(params[:id])
    if @booking.status && @booking.status_refugee && @booking.chatroom.nil?
      @chatroom = Chatroom.new
    end
  end

  def new
    if current_user.profile_complete?
      @booking = Booking.new
    else
      flash[:danger] = 'First, we need more information about yourself. Please fill this form.'
      redirect_to edit_user_path(current_user)
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.arrival_date = Date.today
    @booking.departure_date = Date.today + 1
    @booking.refugee_id = current_user.id
    if @booking.refugee.first_name.present? && @booking.refugee.last_name.present? && @booking.refugee.username.present? && @booking.refugee.description.present? && @booking.refugee.identity_number.present? && @booking.refugee.profile_picture.present?
      @booking.room_id = Room.where(host_id: User.where(email: "admin@gmail.com")).first.id
      if @booking.save
        redirect_to bookings_path
      else
        redirect_to error_page_path
      end
    else
      flash[:danger] = 'First, we need more information about yourself. Please fill this form.'
      redirect_to edit_user_path(current_user)
    end
  end

  def update_bookings
    @bookings = Booking.all
    Room.all.each do |room|
      room.update(availability: true)
    end

    @bookings_today = Booking.where(arrival_date: Date.today)
    @bookings_today_desc = @bookings.order(beds: :desc)
    @rooms_available = Room.where(availability: true)
    @bookings_today_desc.each do |booking|
      room_found = find_room(booking, @rooms_available, 0.2)

      if room_found.present? && room_found.instance_of?(Room)
        booking.update(room: room_found)
        room_found.update(availability: false)
      end
    end
    redirect_to bookings_path
  end

  def find_room(booking, rooms, distance)
    @distance = distance
    if @distance <= 10
      if rooms.near(booking.address, @distance).empty?
        find_room(booking, rooms, @distance + 0.2)
        @distance += 0.2

      else
        @result = rooms.near(booking.address, distance).find do |room|
          room.availability && (room.beds - booking.beds) >= 0 && (room.beds - booking.beds) <= 2
        end
        @result
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def accept_booking
    @booking = Booking.find(params[:format])
    @chatroom = Chatroom.new
    @chatroom.booking_id = @booking.id
    @chatroom.name = "Chatroom"
    if current_user.role == "refugee"
      @booking.update(status_refugee: true)
    else
      @booking.update(status: true)
    end
    if @chatroom.save
      redirect_to bookings_path
    else
      raise
    end
  end

  def decline_booking
    @booking = Booking.find(params[:format])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_date, :departure_date, :beds, :address)
  end

end

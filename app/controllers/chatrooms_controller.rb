class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
  end


end

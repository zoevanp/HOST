class ChatroomsController < ApplicationController

  def index
    # @booking
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:booking_id)
  end

end

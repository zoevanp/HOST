class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @chatroom = Chatroom.new
    @booking = Booking.find(params[:booking_id])
    @chatroom.booking_id = Booking.find(params[:booking_id]).id
    @chatroom.name = "Chatroom"

    if @chatroom.save
      redirect_to booking_chatroom_path(@booking, @chatroom)
    else
      raise
    end
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

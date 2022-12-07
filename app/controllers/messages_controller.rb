class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @booking = Booking.find(params[:booking_id])
    @user_id = current_user.id
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.booking = @booking
    @message.user_id = @user_id
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: {message: @message}),
        sender_id: @message.user.id
      )
      head :ok
    else
      raise
      render "chatroom/show", status: :uprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

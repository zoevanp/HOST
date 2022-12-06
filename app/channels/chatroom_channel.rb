class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # raise
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

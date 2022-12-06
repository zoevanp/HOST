class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :booking
  belongs_to :user
end

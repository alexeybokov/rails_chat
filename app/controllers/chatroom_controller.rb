class ChatroomController < ApplicationController
  def index
    @message = Message.new
    @recently_messages = Message.recently_ten_messages
  end
end

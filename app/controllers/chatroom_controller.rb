class ChatroomController < ApplicationController
  def index
    @online_users = User.where(status: 'Online')
    @users = User.all
    @message = Message.new
    @recently_messages = Message.recently_ten_messages
  end
end

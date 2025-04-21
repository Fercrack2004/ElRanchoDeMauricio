class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatable

  def show
    @message = @chat_room.messages.new
  end

    private

  def set_chatable
    if params[:blog_id]
      @chatable = Blog.find_by(id: params[:blog_id])
    elsif params[:information_id]
      @chatable = Information.find_by(id: params[:information_id])
    end
      @chat_room = @chatable.chat_room
  end
end

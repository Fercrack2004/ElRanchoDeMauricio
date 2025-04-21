class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room

  def create
    @message = @chat_room.messages.create(message_params.merge(user: current_user))
      if @message.persisted?
        redirect_to [@chatable, @chat_room]
      else
        flash.now[:alert] = "Message could not be sent. Please try again."
          redirect_to [@chatable, @chat_room]
      end
  end

    private

  def set_chat_room
    if params[:blog_id]
      @chatable = Blog.find_by(id: params[:blog_id])
    elsif params[:information_id]
      @chatable = Information.find_by(id: params[:information_id])
    end
      @chat_room = @chatable.chat_room
  end

  def message_params
    params.require(:message).permit(:user, :content)
  end

end

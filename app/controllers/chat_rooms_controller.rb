class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatable
  before_action :authorize_user!

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
    @chat_room = @chatable&.chat_room
  end

  def authorize_user!
    return if @chatable.blank? || @chat_room.blank?

    participation = find_participation

    unless participation&.autor_contribution? || participation&.editor_contribution? ||
           current_user.admin?
      redirect_to root_path, alert: "No tienes permiso para acceder a este chat."
    end
  end

  def find_participation
    if @chatable.is_a?(Blog)
      @chatable.blog_participations.find_by(user: current_user)
    elsif @chatable.is_a?(Information)
      @chatable.information_participations.find_by(user: current_user)
    end
  end
end

class InformationPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_moderator, only: [:new, :create]
    
  def index
    @search_term = params[:search]
    @information = if @search_term.present?
                     Information.where("title LIKE ? OR description LIKE ?", 
                                       "%#{@search_term}%", "%#{@search_term}%")
                    else
                      Information.all
                    end.order(created_at: :desc)
  end
  
  def show
    @information = Information.find(params[:id])
  end
  
  def new
    @information = Information.new
  end
  
  def create
    @information = Information.new(information_params)
    
    if @information.save
      # Asociar al usuario actual como autor
      @information.information_participations.create(user: current_user, contribution: :autor)
      # Crear el chatroom correspondiente
      @information.create_chat_room(name: "Chat de editores: \"#{@information.title}\"")
      redirect_to @information, notice: "Página de información creada con éxito"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @information = Information.find(params[:id])
  end
  
  def update
    @information = Information.find(params[:id])
      if @information.update(information_params)
        @information.chat_room.update(name: "Chat de editores: \"#{@information.title}\"")
        redirect_to @information
      end
    end
  
    private
  
  def information_params
    params.require(:information).permit(:title, :info_type, :description)
  end

  def require_moderator
  unless current_user&.moderator? || current_user&.admin?
    redirect_to root_path, alert: "No tienes permisos para realizar esta acción."
    end
  end
end
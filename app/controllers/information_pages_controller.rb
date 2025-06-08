class InformationPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_moderator, only: [:new, :create]
  before_action :require_editor_or_author, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]
    
  def index
    @search_term = params[:search]

    # El nombre del modelo debe ser singular: InformationPage
    base_query = Information.includes(:information_participations, :users)

    @information_pages = if @search_term.present?
                           base_query.where("information_pages.title ILIKE :search 
                                            OR information_pages.description ILIKE :search", 
                                            search: "%#{@search_term}%")
    else
      base_query
    end.order(created_at: :desc)
  end
  
  def show
    @information = Information.includes(
      :card_image_attachment, # Precarga la imagen de portada
      sections: :image_attachment, # Precarga las secciones y sus imágenes
      information_participations: :user # Precarga las participaciones y los usuarios asociados
    ).find(params[:id])
  end
  
  def new
    @information = Information.new
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    respond_to do |format|
      format.html {
    redirect_to information_pages_url, notice: "Página de informacipon eliminada correctamente.",
                                       status: :see_other }
      format.json { head :no_content }
    end
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
    params.require(:information).permit(:title, :info_type, :description, :card_image,
                                        sections_attributes: [:id, :title, :content, :image, :_destroy]
    )
  end

  def require_moderator
    unless current_user&.moderator? || current_user&.admin?
      redirect_to root_path, alert: "No tienes permisos para realizar esta acción."
      end
  end

  def require_editor_or_author
    @information = Information.find(params[:id])
  participation = @information.information_participations.find_by(user_id: current_user.id)
  unless participation&.editor_contribution? || participation&.autor_contribution? ||
         current_user&.admin?
    redirect_to root_path, alert: "No tienes permisos para acceder a esta sección."
    end
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "No tienes permisos para realizar esta acción."
      end
  end
end
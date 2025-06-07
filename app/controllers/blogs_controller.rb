class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_moderator, only: [:new, :create]
  before_action :require_editor_or_author, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def index
    @search_term = params[:search]
    
    # Empezamos con la consulta base, precargando todas las asociaciones que usaremos en la vista.
    # Esto soluciona el problema de N+1 queries.
    base_query = Blog.includes(:reviews, :blog_participations, :users)

    # La variable debe ser @blogs (plural) para que la vista pueda iterar sobre ella.
    @blogs = if @search_term.present?
      # Usamos ILIKE para búsquedas que no distinguen mayúsculas/minúsculas y variables de enlace para seguridad.
      base_query.where("blogs.title ILIKE :search OR blogs.description ILIKE :search", search: "%#{@search_term}%")
    else
      # Si no hay búsqueda, usamos la consulta base sin filtros.
      base_query
    end.order(created_at: :desc)
  end
  
  def show
    @blog = Blog.includes(blog_participations: :user).find(params[:id])
  end
  
  def new
    @blog = Blog.new
  end
      
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      # Asociar al usuario como autor
      @blog.blog_participations.create(user: current_user, contribution: :autor)
      # Crear el chatroom correspondiente
      @blog.create_chat_room(name: "Chat de editores: \"#{@blog.title}\"")
      redirect_to @blog, notice: "Blog creado con éxito!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
    @blog.ingredients.build if @blog.ingredients.empty?
    @blog.steps.build if @blog.steps.empty?
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        @blog.chat_room.update(name: "Chat de editores: \"#{@blog.title}\"")
        redirect_to @blog
      end
    end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog eliminado correctamente.", status: :see_other }
      format.json { head :no_content }
    end
  end
  
    private
  
  def blog_params
<<<<<<< HEAD
    params.require(:blog).permit(:title, :public_type, :description, :cook_time,
=======
    params.require(:blog).permit(:title, :public_type, :description, :cook_time, :card_image,
>>>>>>> origin/Fercrack2004
    ingredients_attributes: [:id, :name, :quantity, :image, :_destroy],
    steps_attributes: [:id, :description, :step_num, :image, :_destroy]
  )
  end

  def require_moderator
    unless current_user&.moderator? || current_user&.admin?
      redirect_to root_path, alert: "No tienes permisos para realizar esta acción."
      end
  end

  def require_editor_or_author
    @blog = Blog.find(params[:id])
  participation = @blog.blog_participations.find_by(user_id: current_user.id)
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
class BlogsController < ApplicationController
  def index
    @search_term = params[:search]
    @blog = if @search_term.present?
              Blog.where("title LIKE ? OR description LIKE ?", 
                         "%#{@search_term}%", "%#{@search_term}%")
             else
               Blog.all
             end.order(created_at: :desc)
  end
  
  def show
    @blog = Blog.find(params[:id])
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
  end

  def update
    @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        @blog.chat_room.update(name: "Chat de editores: \"#{@blog.title}\"")
        redirect_to @blog
      end
    end
  
    private
  
  def blog_params
    params.require(:blog).permit(:title, :public_type, :description, :cook_time)
  end
  end
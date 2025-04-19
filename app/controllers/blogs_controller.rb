class BlogsController < ApplicationController

    def show
        @blog = Blog.find(params[:id])
    end

    def new
        @blog = Blog.new
    end
    
    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            @blog.blog_participations.create(user: current_user, contribution: :autor)
            redirect_to @blog, notice: "Blog creado con éxito!"
        else
            render :new, status: :unprocessable_entity
        end
    end


    def index
        @blogs = Blog.includes(:users).order(created_at: :desc).limit(3) # Muestra los 3 más recientes
      end

    private

    def blog_params
        params.require(:blog).permit(:title, :public_type, :description)
    end

end

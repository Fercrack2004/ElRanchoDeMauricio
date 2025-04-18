class BlogsController < ApplicationController
    def new
        @blog = Blog.new
    end
    
    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to @blog, notice: "Blog creado con éxito!"
        else
            render :new, status: :unprocessable_entity
        end
    end


    private

  def blog_params
    params.require(:blog).permit(:title, :public_type, :description)
  end

end

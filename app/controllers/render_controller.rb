class RenderController < ApplicationController
  def index
    @blogs = Blog.includes(:blog_participations, :users)
                 .order(created_at: :desc)
                 .limit(3)
  rescue => e
    @blogs = []
    logger.error "Error al cargar blogs: #{e.message}"
  end
end

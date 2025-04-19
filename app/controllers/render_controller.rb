class RenderController < ApplicationController
  def index
    @blogs = Blog.order(created_at: :desc).limit(3)
    @informations = Information.order(created_at: :desc).limit(3)
  rescue ActiveRecord::RecordNotFound
    @blogs = []
    @informations = []
  end
end

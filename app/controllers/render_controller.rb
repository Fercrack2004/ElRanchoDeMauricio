class RenderController < ApplicationController
  def index
    @search_term = params[:search]
    
    if @search_term.present?
      # Modo búsqueda like searching fr
      @blogs = search_blogs(@search_term)
      @informations = search_informations(@search_term)
      @showing_search_results = true
    else
      # Modo normal like normie asf
      @blogs = Blog.order(created_at: :desc).limit(3)
      @informations = Information.order(created_at: :desc).limit(3)
      @showing_search_results = false
    end
  rescue ActiveRecord::RecordNotFound
    @blogs = []
    @informations = []
    @showing_search_results = false
  end

  private

  def search_blogs(term)
    Blog.where("title LIKE ? OR description LIKE ?", 
              "%#{term}%", "%#{term}%")
       .order(created_at: :desc)
  end

  def search_informations(term)
    Information.where("title LIKE ? OR description LIKE ?", 
                     "%#{term}%", "%#{term}%")
              .order(created_at: :desc)
  end
end
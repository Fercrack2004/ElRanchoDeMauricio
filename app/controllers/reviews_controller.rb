class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reviewable

  def index
    @reviews = @reviewable.reviews
  end

  def new
    @review = @reviewable.reviews.new
  end

  def create
    @review = @reviewable.reviews.new(review_params)
    @review.user = current_user
  
      if @review.save
        redirect_to @reviewable, notice: "Review created!"
      else
        render :new
      end
    end
    
  def show
    @review = @reviewable.reviews.find(params[:id])
  end
    
    private

  def set_reviewable
    if params[:blog_id]
      @reviewable = Blog.find_by(id: params[:blog_id])
    elsif params[:information_id]
      @reviewable = Information.find_by(id: params[:information_id])
    end
  end

    
  def review_params
    params.require(:review).permit(:score, :content)
  end
end

class RequestsController < ApplicationController
    before_action :set_requestable

    def index
        @requests = @requestable.requests
    end

    def new
        @request = @requestable.requests.new
    end
    
    def create
        @request = @requestable.requests.new(request_params)
        @request.user = current_user
    
        if @request.save
            redirect_to @requestable, notice: "Request sent!"
        else
            render :new
        end
    end

    def update

    end

    private

  def set_requestable
    if params[:blog_id]
      @requestable = Blog.find_by(id: params[:blog_id])
    elsif params[:information_id]
      @requestable = Information.find_by(id: params[:information_id])
    end
  end

  def request_params
    params.require(:request).permit(:description)
  end

end

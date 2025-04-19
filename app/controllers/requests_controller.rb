class RequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_requestable
    def index
        @requests = @requestable.requests
    end

    def show
        @request = @requestable.requests.find_by(id: params[:id])
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
        @requests = @requestable.requests
        @request = @requestable.requests.find(params[:id])
        if @request.update(state: params[:state])
            if @request.accepted?
                redirect_to polymorphic_path([@requestable, :requests]), notice: "Solicitd aceptada!"
            else
                redirect_to polymorphic_path([@requestable, :requests]), notice: "Solicitd rechazada!"
            end
        else
          redirect_to @requests, alert: "No se puedo modificar el estado de la solicitud."
        end
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

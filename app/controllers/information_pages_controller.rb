class InformationPagesController < ApplicationController

  def show
    @information = Information.find(params[:id])
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
      if @information.save
        @information.information_participations.create(user: current_user, contribution: :autor)
          redirect_to @information, notice: "Informacion Creada con Exito"
      else
        render :new, status: :unprocessable_entity
      end
  end
    private
    
  def information_params
    params.require(:information).permit(:title, :info_type, :description)
  end
end

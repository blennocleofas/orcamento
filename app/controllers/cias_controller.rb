class CiasController < ApplicationController
  def index
  	@cia = Cia.all
  end
  def show
  	@cia = Cia.find(params[:id])
  end

  def edit
  	@cia = Cia.find(params[:id])
  end

  def new
  	@cia = Cia.new
  end

  def destroy
  	@cia = Cia.find(params[:id])
  	@cia.destroy
  	redirect_to cias_path
  end

  def create

  	@cia = Cia.new(cias_params)
  		
  		if @cia.save
  			redirect_to cia_path @cia
  		else
  			render 'new'
  		end

  end

  def update
  end
  private
  	def cias_params
  		params.require(:cia).permit(:nome, :cod, :logo)
  	end
end

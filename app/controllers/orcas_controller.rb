require 'httparty'
class OrcasController < ApplicationController
  def edit
    @orcamento = Orca.find(params[:id])
  end

  def index
  	@orcamento = Orca.all
  end

  def show
    @orcamento = Orca.find(params[:id])
    if Rails.env.production?  
      EnviarEmail.perform_async(@orcamento.id)
    else
      #OrcamentoMailer.orcamento_email(@orcamento).deliver
    end
    #EnviarEmail.perform_in(30.seconds, @orcamento.id)
  end

  def aereos
    @cia = Cia.find(params[:id])
    render json: @cia  
  end

  def destroy
    @orcamento = Orca.find(params[:id])
    @orcamento.destroy
    redirect_to orcas_path
    
  end

  def create
  @orcamento = Orca.new(orcamento_params)
      if @orcamento.save
        redirect_to orca_path @orcamento
      else
        render 'new'
      end
  end
  def update
    #render text: params.inspect
    @orcamento = Orca.find(params[:id])
    if @orcamento.update(orcamento_params)
      redirect_to orca_path(@orcamento)
    else
      render 'edit'
    end
    
  end

  def new
  	@orcamento = Orca.new
    @orcamento.clientes.build
    @orcamento.aereos.build
    @orcamento.hotels.build
  	
  end

  def voo
    cia = params[:cia]
    id = params[:id]
    response = HTTParty.get("https://api.flightstats.com/flex/ratings/rest/v1/json/flight/#{cia}/#{id}?appId=6a867356&appKey=81b707f2f96d9681e6264564b1a615f3")
    #response = HTTParty.get('https://graph.facebook.com/zuck')
    #body = JSON.parse(response.body)
    render json: response.body
  end

  def save
  end
  private
    def orcamento_params
      params.require(:orca).permit(:titulo, 
      clientes_attributes: [:id, :nome, :sobrenome, :email, :_destroy],
      aereos_attributes: [:id, :voo, :cia, :ida, :volta, :origem, :destino, :tarifa, :taxa, :_destroy],
      hotels_attributes: [:id, :nome, :foto, :tipo,:data_ida, :data_volta, :_destroy])
    end
end

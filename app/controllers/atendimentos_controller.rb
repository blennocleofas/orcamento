class AtendimentosController < ApplicationController
  def index
  	@atendimento = Atendimento.all
  end
    
  def show
    @atendimento = Atendimento.find(params[:id])
  end

  def new
  	@atendimento = Atendimento.new
  end


  def create
    #render text: atendimento_params
     @atendimento = Atendimento.create(atendimento_params)
     if @atendimento.save
       redirect_to atendimento_path @atendimento
     else
       render 'new'
     end
  
  end

  def destroy
  end

  def update
  end

  def cliente
    @cliente = Cliente.search(params[:q])
    render :json => @cliente, :callback => params[:callback]
  end
  private 
    def atendimento_params
      params.require(:atendimento).permit(:nome_completo, 
                     :email, :telefone, :origem, :destino, :data_ida, :data_volta, :obs,
                     :criancas, :adultos, :nenem, :tipo, :status_fila, :cliente_id)
    end
end

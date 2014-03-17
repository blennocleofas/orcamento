class Api::AtendimentosController < ApplicationController
	def index
		@atendimento = Atendimento.all
		render :json => @atendimento
	end

	def new
	end

	def create
		render :json => atendimento_params
	end

	def update
	end

	private 
	  def atendimento_params
	    params.permit(:nome_completo, 
	                   :email, :telefone, :origem, :destino, :data_ida, :data_volta, :obs,
	                   :criancas, :adultos, :nenem, :tipo, :status_fila, :cliente_id)
	  end
end
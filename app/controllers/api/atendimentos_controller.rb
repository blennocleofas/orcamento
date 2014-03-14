class Api::AtendimentosController < ApplicationController
	def index
		@atendimento = Atendimento.all
		render :json => @atendimento
	end

	def new
	end

	def create
	end

	def update
	end
end
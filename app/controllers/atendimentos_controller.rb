class AtendimentosController < ApplicationController
  def index
  	@atendimento = Atendimento.all
  end
  def new
  	@atendimento = Atendimento.new
  end

  def create
  end

  def destroy
  end

  def update
  end
end

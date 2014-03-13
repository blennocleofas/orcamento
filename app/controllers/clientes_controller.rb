class ClientesController < ApplicationController
  def index
  end

  def save
  end

  def update
  end

  def create
    @cliente = Cliente.new(clientes_params)
    if @cliente.save
      render json: @cliente
    else
      render 'new'
    end
  end

  def destroy
  end
  
  private
    def clientes_params
      params.require(:cliente).permit(:nome, :sobrenome,:email,:telefone)
    end
end

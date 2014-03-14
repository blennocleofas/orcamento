class HomeController < ApplicationController
  layout "mkt"
  def index
  	@atendimento = Atendimento.new
  end

  def save
  end
end

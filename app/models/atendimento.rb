class Atendimento < ActiveRecord::Base
	belongs_to :cliente
	belongs_to :fonte
	belongs_to :status

end

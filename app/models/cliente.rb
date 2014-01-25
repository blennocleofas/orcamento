class Cliente < ActiveRecord::Base
	belongs_to :orca

	#Validar
	validates :nome, :sobrenome, :email, presence: true
	def nome_completo
		"#{nome} #{sobrenome}"	
	end
end

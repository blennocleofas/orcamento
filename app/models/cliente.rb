
class Cliente < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks
	belongs_to :orca

	tire.mapping do
	   indexes :id, :type => 'string', :index => :not_analyzed
	   indexes :nome, analyzer: 'snowball', boost: 100
	   indexes :sobrenome, analyzer: 'snowball', boost: 100
	 end

	#Validar
	validates :nome, :sobrenome, :email, presence: true
	def nome_completo
		"#{nome} #{sobrenome}"	
	end
end

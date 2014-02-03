
class Cliente < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks
	belongs_to :orca

	settings :number_of_shards => 1,
	         :number_of_replicas => 1,
	         :analysis => {
	         	:filter => {
	            	:url_ngram  => {
	                	"type"     => "nGram",
	                    "max_gram" => 10,
	                    "min_gram" => 2 }
	                },
	                :analyzer => {
	                  :url_analyzer => {
	                     "tokenizer"    => "standard",
	                     "filter"       => ["standard", "lowercase", "stop", "kstem", "ngram", "url_ngram"],
	                     "type"         => "custom" }

	                }
	              } do
	       mapping { indexes :nome, :type => 'string', :analyzer => "url_analyzer" }
	     end

	#Validar
	validates :nome, :sobrenome, :email, presence: true
	def nome_completo
		"#{nome} #{sobrenome}"	
	end

	def self.regular_search(params) 
	  tire.search(load: true) do
	     query {string 'nome:' + params }
	  end
	end
end

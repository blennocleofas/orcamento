class Aeroportos < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks

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
	                  :busca_aeroportos => {
	                     "tokenizer"    => "standard",
	                     "filter"       => ["standard", "lowercase", "stop", "kstem", "ngram", "url_ngram"],
	                     "type"         => "custom" }

	                }
	              } do
	       mapping { indexes :nome, :type => 'string', :analyzer => "busca_aeroportos" }
	end
end

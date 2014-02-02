class Aeroportos < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks


end

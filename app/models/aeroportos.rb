class Aeroportos < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks

	tire do
	    mapping do
	      indexes :name,       type: 'string', as: 'id'
	      indexes :cod,        type: 'string', as: 'cod'
	      indexes :location,   type: 'geo_point', as: 'lat_lon'
	    end
	  end

  def lat_lon
    [lat.to_f, lon.to_f].join(',')
  end

end

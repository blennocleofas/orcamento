class Aereo < ActiveRecord::Base
	belongs_to :orca
	validates :voo, :cia, :ida, :volta, presence: true
end

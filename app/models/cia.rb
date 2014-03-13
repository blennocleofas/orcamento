class Cia < ActiveRecord::Base
	mount_uploader :logo, LogoCiaUploader
	validates :nome,:cod,:logo, presence: true
end

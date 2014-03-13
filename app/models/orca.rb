class Orca < ActiveRecord::Base
	#Relacionamento
	has_many :clientes
	has_many :aereos, dependent: :destroy
	has_many :hotels, dependent: :destroy

	#Validacao
	validates :titulo, presence: true

	accepts_nested_attributes_for :clientes, :aereos, :hotels, 
	:allow_destroy => true
end

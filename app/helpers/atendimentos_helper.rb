module AtendimentosHelper
	def pessoas(atendimento)
		atendimento.adultos.to_i + atendimento.criancas.to_i
	end
end

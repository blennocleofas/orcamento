class OrcamentoMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default from: "orcamento@proximoembarque.com.br"

  def orcamento_email(orcamento)
    @orcamento = orcamento
    @cliente = @orcamento.clientes.first
  	mail(to: @cliente.email, subject: @orcamento.titulo)
  end

end

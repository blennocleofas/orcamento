class EnviarEmail
  include Sidekiq::Worker
  def perform(orcamento_id)
  orcamento = Orca.find(orcamento_id)
  OrcamentoMailer.orcamento_email(orcamento).deliver
  end
end
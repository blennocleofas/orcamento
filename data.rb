require 'date'


class Float
  def abaixo n=0
  s = self.to_s
  l = s.index('.') + 1 + n
  s.length <= l ? self : s[0,l].to_f
  end
end

data_prevista = Time.local(2014, 2, 4, 1, 00)

timestap_js = data_prevista.to_i * 1000

a = data_prevista - Time.now

dias = (a / 86400).round 
horas = ((a % 86400).abs / 3600).abaixo.round
minutos = ((a % 3600).abs / 60 ).abaixo.round
segundos = (a % 60).round.abs

puts Time.now
puts data_prevista

puts "#{dias}d, #{horas}h, #{minutos}m, #{segundos}s"

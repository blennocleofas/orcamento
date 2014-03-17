module ApplicationHelper

	def link_icon(icon,text,link)
		link_to "<i class='fa #{icon}'></i> #{text}".html_safe , link 
  end
  def logo_operadora(id,alt)
    cl_image_tag id, :format => 'png', alt: alt
  end
  def nome_operadora(cod)
    Cia.where(:cod => cod ).first.nome
  end
  def logo_find(cia)
    cia =  Cia.where(:cod => cia ).first
    cl_image_tag cia.logo.full_public_id, :format => 'png', alt: cia.nome
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def data_restante

    data_prevista = Time.local(2014, 3, 30, 8, 59)
    timestap_js = data_prevista.to_i * 1000
    a = data_prevista - Time.now

    dias = (a / 86400).round 
    horas = ((a % 86400).abs / 3600).round
    minutos = ((a % 3600).abs / 60 ).round
    segundos = (a % 60).round.abs

    "<h1 data-time='#{timestap_js}' id='countdown'>#{dias}d, #{horas}h, #{minutos}m, #{segundos}s</h1>"
  end
  #helper_method :current_user
end

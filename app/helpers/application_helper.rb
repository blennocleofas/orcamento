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
  #helper_method :current_user
end

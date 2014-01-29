class SessionsController < ApplicationController
	def create
		omniauth = env["omniauth.auth"]
		info  = omniauth["extra"]["raw_info"]

		if info["hd"].to_s == "proximoembarque.com.br".to_s
			user = User.from_omniauth(env["omniauth.auth"])
	 		session[:user_id] = user.id
	  		redirect_to orcas_path, notice: "Seja bem vindo! #{user.name}"	
		else
			render text: "Este e-mail não esta autoziado"
		end

	  
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Você saiu do Sitema"
	end

	def failure
	  redirect_to root_url, alert: "Autenticação falhou.. tente novamente"
	end
end

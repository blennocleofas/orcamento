class SessionsController < ApplicationController
	def create
		omniauth = env["omniauth.auth"]
		info  = omniauth["extra"]["raw_info"]

		if info["hd"].to_s == "proximoembarque.com.br".to_s
			user = User.from_omniauth(env["omniauth.auth"])
	 		session[:user_id] = user.id
	  		redirect_to orcas_path, notice: "Signed in!"	
		else
			render text: "Este e-mail não esta autoziado"
		end

	  
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Signed out!"
	end

	def failure
	  redirect_to root_url, alert: "Authentication failed, please try again."
	end
end

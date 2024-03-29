class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user?
      session[:user_id]
  end
  helper_method :user?
  
  def login
      redirect_to '/auth/google_oauth2' unless user?
  end
    
end

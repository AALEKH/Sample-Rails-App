class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
 
  private
 
  def require_login
    if session[:session_user_variable].nil?
       flash[:error] = "You must be logged in to access this section"
       redirect_to "/sessions/new" # halts request cycle new_session_path  new_session 
    end
  end

end
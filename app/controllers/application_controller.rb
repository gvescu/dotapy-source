class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_admin_user
    if current_user.blank?
      redirect_to root_path
      return
    else
      unless current_user.admin
        redirect_to root_path
        return
      end
    end
  end
  
  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end

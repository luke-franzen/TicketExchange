class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def set_current_user
    @current_user ||= User.find_by_session_token(cookies[:session_token])
    #redirect_to login_path unless @current_user
  end

  def current_user?(id)
    @current_user.id.to_s == id
  end
  
  def currentuser_is_admin?
    @admins = ["luke.franzen@gmail.com", "test@gmail.com"]
    if @current_user
      @admins.include?(@current_user.email)
    end
  end
  
  helper_method :current_user?, :currentuser_is_admin?
end
class SessionsController < ApplicationController
  skip_before_filter :set_current_user

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      cookies.permanent[:session_token] = user.session_token
      flash[:notice] = 'Welcome, ' + user.first_name + ' ' + user.last_name
      redirect_to welcome_index_path
    else
      flash[:notice] = 'Invalid email/password combination'
      redirect_to new_user_path
    end
  end

  def destroy
    cookies.delete(:session_token)
    @current_user = nil
    redirect_to welcome_index_path
  end
end

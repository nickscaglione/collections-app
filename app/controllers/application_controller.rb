class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end 
  end

private
  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end     



end

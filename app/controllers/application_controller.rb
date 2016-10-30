class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def index
    render :index
  end

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  private

  def require_logged_in
    flash[:target_path] = request.path if !current_user
    flash[:notice] = "You need to be logged in to view that page"
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end



end

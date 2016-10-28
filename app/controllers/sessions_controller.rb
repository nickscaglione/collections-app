require 'byebug'

class SessionsController < ApplicationController
  def new
    # adding a new user to be used in the sign-in form_for; the form will need
    # to redirect manually to sessions#create method
    flash.keep[:target_path]
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user.authenticate(params[:password]) == false
      flash[:notice] = "Incorrect Password"
      flash[:attempted_path] = flash[:attempted_path]
      redirect_to login_path
    else
      session[:user_id] = @user.id
      if flash[:target_path]
        redirect_to flash[:target_path]
      else
        redirect_to home_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end

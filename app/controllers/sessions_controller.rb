require 'byebug'

class SessionsController < ApplicationController
  def new
    # adding a new user to be used in the sign-in form_for; the form will need
    # to redirect manually to sessions#create method
    @user = User.new
  end

  def create
    # byebug
    @user = User.find_by(user_name: params[:user_name])
    if @user.authenticate(params[:password]) == false 
      # byebug
      flash[:notice] = "Incorrect Password"
      redirect_to login_path
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end
end

require 'byebug'

class SessionsController < ApplicationController
  def new
    # adding a new user to be used in the sign-in form_for; the form will need
    # to redirect manually to sessions#create method
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:session][:user_name])
    return head(:forbidden) unless @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end
end

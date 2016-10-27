class SessionsController < ApplicationController
  def new
    # adding a new user to be used in the sign-in form_for; the form will need
    # to redirect manually to sessions#create method
    @user = User.new
  end

  def create
    
  end

  def destroy
  end

end

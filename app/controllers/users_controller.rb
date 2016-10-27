class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

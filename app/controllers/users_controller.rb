class UsersController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if !@user.save
      flash[:notice] = @user.errors.full_messages[0]
      redirect_to register_path

    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:notice] = "Passwords do not match"
      redirect_to register_path

    else
      @user.save
      owner = Owner.create(name: @user.user_name, user_id: @user.id)
      session[:user_id] = @user.id
      redirect_to home_path
    end
  end

  def edit
  end

  def destroy
  end

  def show
    @user = User.find(current_user)
    @owner = Owner.find_by(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end

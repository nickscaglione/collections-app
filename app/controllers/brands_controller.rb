class BrandsController < ApplicationController
  def new
    @user = User.find(current_user)
    @brand = Brand.new
  end

  def index
    @brands = Brand.all
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.current_user = current_user
    if @brand.save
      redirect_to @brand
    else
      flash[:notice] = @brand.errors.full_messages.first
      render :new
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.current_user = current_user
    @brand.category = params[:brand][:category]
    if @brand.save
      redirect_to @brand
    else
      flash[:notice] = @brand.errors.full_messages.first
      render :edit
    end
  end

  def show
    #@brand = brand.find_by(user_id: current_user)
    @brand = Brand.find(params[:id])
    byebug
    @owner = Owner.find_by(user_id: current_user.id)
  end

  private

  def brand_params
    {category: params[:brand][:category], owner: Owner.find_by(user_id: current_user.id)}
  end


end

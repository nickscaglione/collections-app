class BrandsController < ApplicationController
    before_action :require_logged_in

  def new
    @user = User.find(current_user)
    @brand = Brand.new
  end

  def index
    # byebug
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
    @brand = Brand.find_by_id(params[:id])
    # byebug
    if !@brand
      redirect_to(brands_path(current_user), :notice => 'No Collection With That ID')
    else
      @cards = []
      @brand.cards.each do |card| 
         @cards << [card.name, card.count]
      end 
      @owner = Owner.find_by(user_id: current_user.id)
    end 
  end

  
  def destroy
    @brand = Brand.find(params[:id])
    #byebug
    @brand.delete
    redirect_to brands_path(current_user)
  end
  

  private

  def brand_params
    {category: params[:brand][:category], owner: Owner.find_by(user_id: current_user.id), api_name: params[:brand][:api_name]}
  end


end

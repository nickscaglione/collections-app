require 'byebug'
class CardsController < ApplicationController
  def new
    # @user = User.find(3)
    @card = Card.new
    if current_user == nil
      redirect_to login_path
    else
      @user = User.find(current_user)
    end
  end

  def create
    @card = Card.new
    # @card.current_user = @user
    @user = User.find(current_user)
    if params[:card][:brand] == "other"
      @brand = Brand.create(owner: @user.owner, category: params[:brand])
    else
      @brand = Brand.find_by(category: params[:card][:brand], owner: @user.owner)
    end
        @user.owner.brands.each do |brand|
            brand.cards.each do |card|
                if card.name == params[:card][:name] 
                  flash[:notice] = "you already have some of those! try editing"
                render :new and return
              end
           end 
          end

    @card = Card.create(name: params[:card][:name], count: params[:card][:count], brand_id: @brand.id)
    redirect_to card_path(@card)
  end



  def index
    all = Card.all
    mine = all.select {|card| card.brand.owner.user_id == current_user.id}
    @cards = mine.sort_by {|card| card.brand}
  end

  def edit
    @card = Card.find(params[:id])
    # byebug
    if current_user == nil
      redirect_to login_path
    else
      @user = User.find(current_user)
    end
  end    


  def update
    @card = Card.find(params[:id])
    @user = User.find(current_user)
    if params[:card][:brand] == "other"
      @brand = Brand.create(owner: @user.owner, category: params[:brand])
    else
      @brand = Brand.find_by(category: params[:card][:brand], owner: @user.owner)
      #
    end
    params[:card][:brand_id] = @brand.id
    @card.update(params[:card].permit(:brand_id, :name, :count))
    redirect_to card_path(@card)
  end

  def destroy
    @card = Card.find(params[:id])
    #byebug
    @card.delete
    redirect_to cards_path
  end

  def show
    @card = Card.find(params[:id])
  end
end

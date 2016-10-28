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
    if params[:card][:collection] == "other"
      @collection = Brand.create(owner: @user.owner, category: params[:collection])
    else
      @collection = Brand.find_by(category: params[:card][:collection], owner: @user.owner)
    end
        @user.owner.collections.each do |collection|
            collection.cards.each do |card|
                if card.name == params[:card][:name] 
                  flash[:notice] = "you already have some of those! try editing"
                render :new and return
              end
           end 
          end

    @card = Card.create(name: params[:card][:name], count: params[:card][:count], collection_id: @collection.id)
    redirect_to card_path(@card)
  end



  def index
    all = Card.all
    mine = all.select {|card| card.collection.owner.user_id == current_user.id}
    @cards = mine.sort_by {|card| card.collection}
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
    if params[:card][:collection] == "other"
      @collection = Brand.create(owner: @user.owner, category: params[:collection])
    else
      @collection = Brand.find_by(category: params[:card][:collection], owner: @user.owner)
      #
    end
    params[:card][:collection_id] = @collection.id
    @card.update(params[:card].permit(:collection_id, :name, :count))
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

require 'byebug'
class CardsController < ApplicationController
  def new
    # @user = User.find(3)
    @card = Card.new
    if current_user == nil
      redirect_to login_path
    else
      @owner = Owner.find_by(user_id: current_user.id)
    end
  end

  def create
    @card = Card.new
    @owner = Owner.find_by(user_id: current_user.id)
    if params[:card][:collection] == "other"
      @collection = Collection.create(owner: @owner, category: params[:collection])
    else
      @collection = Collection.find_by(category: params[:card][:collection], owner: @owner)
    end
        @owner.collections.each do |collection|
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
      @owner = Owner.find_by(user_id: current_user.id)
    end
  end


  def update
    @card = Card.find(params[:id])
    @owner = Owner.find_by(user_id: current_user.id)
    if params[:card][:collection] == "other"
      @collection = Collection.create(owner: @owner, category: params[:collection])
    else
      @collection = Collection.find_by(category: params[:card][:collection], owner: @owner)
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

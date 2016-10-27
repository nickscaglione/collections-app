require 'byebug'
class CardsController < ApplicationController
  def new
    # @user = User.find(3)
    @user = User.find(current_user)
    @card = Card.new
  end

  def create
     # byebug
    @user = User.find(current_user)
    if params[:card][:collection] == "other"
      @collection = Collection.create(owner: @user.owner, category: params[:collection])
    else
     #  byebug
      @collection = Collection.find_by(category: params[:card][:collection])

    end
    @card = Card.create(name: params[:card][:name], count: params[:card][:count], collection_id: @collection.id)
    byebug
    redirect_to card_path(@card)
  end

  def index
    all = Card.all
    mine = all.select {|card| card.collection.owner.id = current_user.id}
    @cards = mine.sort_by {|card| card.collection}
  end

  def edit
    @card = Card.find(params[:id])
    # byebug
    @user = User.find(current_user)

  end

  def update
    @card = Card.find(params[:id])
    @user = User.find(current_user)
    byebug
   if params[:card][:collection] == "other"
      @collection = Collection.create(owner: @user.owner, category: params[:collection])
    else
      byebug
      @collection = Collection.find_by(category: params[:card][:collection])
      #
    end
    params[:card][:collection_id] = @collection.id
#    byebug
    # params[:card][:user_name]
    @card.update(params[:card].permit(:collection_id, :name, :count))
    redirect_to card_path(@card)
  end

  def show
    @card = Card.find(params[:id])
  end
end

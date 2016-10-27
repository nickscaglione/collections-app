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
      @collection = Collection.find_by(category: params[:card][:collection])
    end  
      @card = Card.create(name: params[:card][:name], count: params[:card][:count], collection: @collection)
      # byebug
    redirect_to card_path(@card)
  end

  def edit
    @card = Card.find(params[:id])
        @user = User.find(current_user)

  end

  def update
    @card = Card.find(params[:id])

   if params[:card][:collection] == "other"
      @collection = Collection.create(owner: @user.owner, category: params[:collection]).id
    else 
      @collection = Collection.find_by(category: params[:card][:collection]).id
    end  
    params[:card][:collection_id] = @collection
#    byebug

    @card.update(params[:card].permit(:collection_id, :name, :count))
    redirect_to card_path(@card)
  end

  def show
    @card = Card.find(params[:id])
  end
end

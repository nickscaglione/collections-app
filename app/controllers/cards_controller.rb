require 'byebug'
class CardsController < ApplicationController
  def new
    # byebug
    # @user = User.find(3)
    @card = Card.new
    if current_user == nil
      redirect_to login_path
    else
      @owner = Owner.find_by(user_id: current_user.id)
    end

  end

  def choose
    # byebug
    @card = Card.new
    @owner = Owner.find_by(user_id: current_user.id)
 
    @brand = Brand.find_by(category: params[:brand], owner_id: @owner.id) 
    if @brand.api_name == "Pokemon"
     @card_options =   PokemonCards.find_card(params[:search_term], params[:date][:year_min].to_i, params[:date][:year_max].to_i)
    elsif @brand.api_name == "Magic The Gathering"
      @card_options =  MagicTheGathering.find_card(params[:search_term], params[:date][:year_min].to_i, params[:date][:year_max].to_i )
    end 

  end 

  def create
    byebug
    @card = Card.new
    @owner = Owner.find_by(user_id: current_user.id)
    # if params[:card][:brand] == "other"
    #   @brand = Brand.create(owner: @owner, category: params[:brand])
    # else
    # @brand = Brand.find_by(category: params[:card][:brand], owner: @owner)
    # end

   @card = Card.create(name: params[:name], image_url: params[:card][:image_url], count: params[:card][:count], brand_id: params[:brand_id]) 
   
        # @owner.brands.each do |brand|
        #     brand.cards.each do |card|
        #         if card.name == params[:card][:name] 
        #           flash[:notice] = "you already have some of those! try editing"
        #         render :new and return
        #       end
        #    end 
        #   end

    # @card = Card.create(name: params[:card][:name], count: params[:card][:count], brand_id: @brand.id)
    
    redirect_to card_path(@card)
  end



  def index
    all = Card.all
    mine = all.select {|card| card.brand.owner.user_id == current_user.id}
    @cards = mine.sort_by {|card| card.brand}
    @poke = [] 
    @magic = []
    @cards.each do |card| 
      # byebug
      if card.brand.category == "Pokemon"
      @poke << [card.name, card.count]
    elsif card.brand
      @magic << [card.name, card.count]
    end 
  end

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

    if params[:card][:brand] == "other"
      @brand = Brand.create(owner: @owner, category: params[:brand])
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

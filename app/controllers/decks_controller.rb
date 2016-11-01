require 'byebug'
class DecksController < ApplicationController
    before_action :require_logged_in

  def new
    @deck = Deck.new
    if current_user == nil
      redirect_to login_path
    else
      @owner = current_user.owner
    end

  end

  def choose
    @owner = Owner.find_by(user_id: current_user.id)
    @brand = Brand.find_by(category: params[:brand], owner_id: @owner.id)
    @card_by_counts = @brand.cards.each_with_object([]) do |card, cards_array|
      card.count.times do
        cards_array << card
      end
    end
  end

  def create
    # byebug
    @deck = Deck.create(name: params[:name])
    count_hash = {}
    params[:card].each do |card_id|
     count = params[:card].count(card_id)
     count_hash[card_id] = count
    end
    count_hash.each do |card_id, card_count|
      CardDeck.create(deck_id: @deck.id, card_id: card_id, card_count: card_count)
    end
    redirect_to see_decks_path(@deck.owner)
  end

  def edit
    @deck = Deck.find(params[:id])
    # find cards not included in the deck but are included in the deck's parent brand
    @unused_cards = @deck.brand.cards.select { |card| !@deck.cards.pluck(:name).include?(card.name) }
  end

  def update
    @deck = Deck.find(params[:id])
    CardDeck.destroy_all(deck_id: @deck.id)
    count_hash = {}
    params[:card].each do |card_id, card_count|
      CardDeck.create(deck_id: @deck.id, card_id: card_id, card_count: card_count)
    end
    redirect_to @deck
  end

  def show
    if current_user == nil
      redirect_to login_path
    end
    @deck = Deck.find_by_id(params[:id])
    if !@deck
      @owner = current_user.owner
      redirect_to(see_decks_path(current_user), :notice => 'No Deck With That ID')
    else
      @owner = Owner.find_by(user_id: @deck.owner.id)
    end
      # byebug
  end

  def index
    if current_user == nil
      redirect_to login_path
    else
      #@owner = Owner.find_by(user_id: current_user.id)
      @owner = current_user.owner
    end
      @my_decks = []
      Deck.all.each do |deck|
        if deck.owner == @owner
          @my_decks << deck
        end
      end

  end

  def destroy
    @deck = Deck.find(params[:id])
    #byebug
    @deck.destroy 
    @owner = current_user.owner
    redirect_to see_decks_path(current_user)
  end



end

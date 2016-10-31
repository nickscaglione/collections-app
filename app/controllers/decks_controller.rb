require 'byebug'
class DecksController < ApplicationController
  def new
    @deck = Deck.new
    if current_user == nil
      redirect_to login_path
    else
      @owner = Owner.find_by(user_id: current_user.id)
    end
    @brand = Brand.find(params[:id])

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
      # byebug

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
    if !Deck.find(params[:id]) 
        redirect_to new_deck_path
      else
        @owner = Owner.find_by(user_id: @deck.owner.id)
      # byebug
    
    end
  end

  def index

    if current_user == nil
      redirect_to login_path
    else
      #@owner = Owner.find_by(user_id: current_user.id)
       @owner = Owner.find_by(user_id: params[:id])
    end
      @my_decks = []
      Deck.all.each do |deck|
        if deck.owner == @owner
          @my_decks << deck
        end
      end

  end

  private

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :error => "Record not found." }
  end 

end

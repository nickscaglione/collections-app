class DecksController < ApplicationController
  def new
    @deck = Deck.new
    if current_user == nil
      redirect_to login_path
    else
      @owner = Owner.find_by(user_id: current_user.id)
    end

  end

  def create
  end

  def edit
  end

  def update

  end

  def show
    if current_user == nil
      redirect_to login_path
    else
      @deck = Deck.find(params[:id])
      @owner = Owner.find_by(user_id: @deck.owner.id)
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
end

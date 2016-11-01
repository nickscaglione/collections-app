require_relative "../rails_helper.rb"
require 'byebug'
RSpec.describe DecksController, :type => :feature do

  describe "#show" do
    it "has the cards, their count, and their images" do
      log_in
      visit deck_path(@deck)
      expect(page).to have_text("3x Charmander")
      expect(page).to have_css("img[src='https://s3.amazonaws.com/pokemontcg/base1/44.jpg']") 
    end 
  end  

  describe "#new" do 
    it "has radio buttons for existing brands" do 
      deck_creator
      expect(page).to have_css("input", :id => "brand_Pokemon")
    end 
  end 

  describe "#choose" do 
    it "has checkbox images for all cards in the given collection" do
      deck_creator
      click_button('Submit')
      expect(page).to have_css("img[src='https://s3.amazonaws.com/pokemontcg/base1/44.jpg']")
    end 

    it "#creates a new deck" do 
      deck_creator
      click_button('Submit')
      fill_in('Name', :with => "Name")
      check('1')
      check('2')
      click_button('submit')
      # byebug
      @deck = Deck.find_by(name: "Name")
      expect(page).to have_link("Name", href: deck_path(@deck))
    end 
  end

  describe "#edit" do 
    it "shows unused cards" do 
      choice_doer
      visit edit_deck_path(@deck)
      @new_card = Card.all.last
      expect(page).to have_text("Unused cards: Pikachu (max: 4)")
      expect(page).to have_css("input#card_#{@new_card.id}")
    end 

    it "will not allow you to add more of a card than you have" do 
      choice_doer
      visit edit_deck_path(@deck)
      @new_card = Card.all.last
      fill_in("card_#{@new_card.id}", :with => "15")
      click_button("Save changes")
      # byebug
      expect(page).to have_text("You tried to add too many of the following cards: Pikachu")
      #will edit once I have Nick's gate 
    end 
  end

  describe "#index" do 
    it "only show's the current user's decks" do 
      log_in
      do_other_things
      visit see_decks_path
      expect(page).to have_text("Marc's Starters")
      expect(page).not_to have_text("Ducks")
    end
  end 

  describe "#destroy" do 
    it "destroys the deck" do 
      log_in
      visit edit_deck_path(@deck)
      click_button('Delete This Deck (all of it!)')
      expect(page).to have_text("immediato's decks")
      expect(page).not_to have_text("Marc's Starters")
    end 
  end 

end 
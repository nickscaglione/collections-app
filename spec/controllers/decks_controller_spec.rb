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
      expect(page).to have_text("Unused cards:")
      expect(page).to have_css("input#card_#{@new_card.id}")
    end 

    it "will not allow you to add more of a card than you have"
      choice_doer
      visit edit_deck_path(@deck)
      @new_card = Card.all.last
      fill_in("card_#{@new_card.id}", :with => "5")
      click_button("Save changes")
      expect(page).to have_text("")
    end 
  end

end 
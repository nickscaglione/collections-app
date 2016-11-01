require_relative "../rails_helper.rb"
require 'byebug'
RSpec.describe CardsController, :type => :feature do
  
  describe "#new" do 
    it "redirects when nobody is logged in" do 
      current_user = nil
      visit new_card_path
      expect(page).to have_css("h2", text: "Sign in")
    end

    it "has radio buttons for existing brands" do 
      do_things
      log_in
      visit new_card_path
      expect(page).to have_css("input", :id => "brand_Pokemon")
    end 

    it "redirects to choose page upon searching" do 
      card_creator 
      expect(page).to have_css("input", :id => "https://s3.amazonaws.com/pokemontcg/basep/4.jpg")
    end 
  end

  describe "#choose" do 
    it "does not allow you to create a card with a count of zero" do
      card_creator
      choose('https://s3.amazonaws.com/pokemontcg/basep/4.jpg')
      click_button('Submit')
      expect(page).to have_text("Count is not a number")
    end
  end

  describe "#create" do
    it "creates a card in the new collection if the count is legit" do 
      choice_doer
      expect(page).to have_text("immediato's 4x Pikachu from their Pokemon collection")
    end
  end 

  describe "#show" do 
    it "shows a card and its image" do
      do_things
      log_in
      @card = Card.find_by(name: "Bulbasaur")
      visit card_path(@card)
      expect(page).to have_text("immediato's 1x Bulbasaur from their Pokemon collection. featured in the Marc's Starters deck")
      expect(page).to have_css("img[src='https://s3.amazonaws.com/pokemontcg/base1/44.jpg']")
    end
  end 

  describe "#edit" do 
    it "renders update page" do 
      editor
      expect(page).to have_text("Update How Many Bulbasaur You Have")
    end 
  end

  describe "#update" do
    it "will not allow you to update to zero or nil" do 
      editor
      fill_in("card[count]", :with => 0)
      click_button('Update Card Count')
      expect(page).to have_text("Can't have zero of a card! Maybe you meant to delete?") 
    end 

    it "will otherwise update the amount of a card you have" do 
      editor
      fill_in("card[count]", :with => 4)
      click_button('Update Card Count')
      expect(page).to have_text("immediato's 4x Bulbasaur from their Pokemon collection. featured in the Marc's Starters deck")
    end 
  end

  describe "#destroy" do 
    it "will delete all of the card" do
      editor
      click_button('Delete This Card (all of them!)')
      expect(page).to have_text("All My Cards")
      expect(page).not_to have_text("Bulbasaur")
    end 

    it "will delete card from associated decks" do 
      editor
      click_button('Delete This Card (all of them!)')
      expect(@deck.cards.include?(@bulb)).to be false
    end

  end 


end 
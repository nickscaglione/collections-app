require_relative "../rails_helper.rb"
require 'byebug'
RSpec.describe BrandsController, :type => :feature do
  
  describe "#new" do 
    it "redirects when nobody is logged in" do 
      current_user = nil
      visit new_brand_path
      expect(page).to have_css("h2", text: "Sign in")
    end

    it "has radio buttons for APIs" do 
      brand_creator
      expect(page).to have_css("input", :id => "brand_api_name_pokemon")
    end 

    it "does not allow for duplicate category names" do
      brand_creator
      fill_in('brand[category]', :with => "Pokemon")
      click_button('Create Brand')
      expect(page).to have_text("Pokemon category already in use!")
    end 
  end

  describe "#update" do 
    it "does not allow for duplicate category names" do
      log_in 
      @brand2 = Brand.create(category: "Pokemon 2", owner_id: @marc_coll.id, api_name: "Pokemon")    
      visit edit_brand_path(@brand2)
      fill_in('brand_category', :with => "Pokemon")
      click_button('Update Brand')
      expect(page).to have_text("Pokemon category already in use!")
    end 
  end

  describe "#show" do 
    it "shows all the requested information" do
      log_in
      @brand = Brand.find_by(category: "Pokemon", owner_id: @marc_coll.id)
      visit brand_path(@brand)
      expect(page).to have_text("3x Charmander")
      expect(page).to have_css("div#chart-1")
    end 
  end

  describe "#destroy" do 
    it "deletes all associated cards and decks" do 
      log_in
      @brand = Brand.find_by(category: "Pokemon", owner_id: @marc_coll.id)
      visit edit_brand_path(@brand)
      click_button('Delete This Collection (all of it! and all associated cards!)')
      empty = [Card.all.empty?,  CardDeck.all.empty?] #Deck.all.empty?,
      expect(empty).to match_array([true, true]) #true
    end
  end
end
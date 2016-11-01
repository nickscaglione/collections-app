require_relative "../rails_helper.rb"
require 'byebug'
RSpec.describe CardsController, :type => :feature do
  
  describe "#show" do 
    it "lists all the cards and has a chart" do 
      log_in
      visit owner_path(@marc_coll)
      expect(page).to have_text("Bulbasaur")
      expect(page).to have_text("featured in the Marc's Starters deck")
      expect(page).to have_css("div#chart-1")
    end 
  end

end
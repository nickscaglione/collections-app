require 'rails_helper'

RSpec.describe CardDeck, :type => :model do

  describe "#card_id" do
    it "fails to save when trying to put more of a card into a deck than there are in the deck's collection" do
      do_things
      @cubone = Card.create(name: "Cubone", count: 1, brand_id: @marc_poke.id)
      @cd4 = CardDeck.create(card_id: @cubone.id, deck_id: @deck.id, card_count: 4)
      expect(@cd4.persisted?).to eq(false)
    end
  end

end

require 'rails_helper'

RSpec.describe CardDeck, :type => :model do

  describe "#create" do
    it "fails to save when trying to put more of a card into a deck than there are in the deck's brand" do
      do_things
      @cubone = Card.create(name: "Cubone", count: 1, brand_id: @marc_poke.id)
      @cd4 = CardDeck.create(card_id: @cubone.id, deck_id: @deck.id, card_count: 4)
      expect(@cd4.persisted?).to eq(false)
    end

    it "fails to save when card_count is 0" do
      do_things
      @cd5 = CardDeck.create(card_id: @char.id, deck_id: @deck.id, card_count: 0)
      expect(@cd5.persisted?).to eq(false)
    end

    it "fails to save when card_count is nil" do
      do_things
      @cd6 = CardDeck.create(card_id: @char.id, deck_id: @deck.id)
      expect(@cd6.persisted?).to eq(false)
    end

    it "successfully saves with a card_count less than the card's amount in the brand and greater than 0" do
      do_things
      expect(@cd1.persisted?).to eq(true)
    end
  end

end

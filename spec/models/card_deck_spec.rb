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

  describe "#not_zero_or_nil?" do
    it "will not create a CardDeck row if the card_count is zero or nil" do
      do_things
      @cubone = Card.create(name: "Cubone", count: 1, brand_id: @marc_poke.id)
      @cd4 = CardDeck.create(card_id: @cubone.id, deck_id: @deck.id, card_count: 0)
      expect(@cd4.persisted?).to eq(false)
    end
  end

  describe "#count_less_than_brand_count?" do
    it "will not create a CardDeck if card_count is > amount of that card in brand" do
      do_things
      @cd4 = CardDeck.create(card_id: @char.id, deck_id: @deck.id, card_count: 5)
      expect(@cd4.persisted?).to eq(false)
    end
  end


end

require 'byebug'
module DeckHelper


  def do_things
      @marc = User.create(user_name: "immediato", password: "password")
      @marc_coll = Owner.create(name: @marc.user_name, user_id: @marc.id)
      @marc_poke = Brand.create(category: "Pokemon", owner_id: @marc_coll.id, api_name: "Pokemon")
      @bulb = Card.create(name: "Bulbasaur", count: 1, brand_id: @marc_poke.id)
      @char = Card.create(name: "Charmander", count: 3, brand_id: @marc_poke.id)
      @squirt = Card.create(name: "Squirtle", count: 1, brand_id: @marc_poke.id)
      @deck = Deck.create(name: "Marc's Starters")
      @cd1 = CardDeck.create(card_id: @bulb.id, deck_id: @deck.id, card_count: 1)
      @cd2 = CardDeck.create(card_id: @squirt.id, deck_id: @deck.id, card_count: 1)
      @cd3 = CardDeck.create(card_id: @char.id, deck_id: @deck.id, card_count: 1)
  end

end


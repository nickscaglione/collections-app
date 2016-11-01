require 'byebug'
module DeckHelper

  def do_things
      @marc = User.create(user_name: "immediato", password: "password")
      @marc_coll = Owner.create(name: @marc.user_name, user_id: @marc.id)
      @marc_poke = Brand.create(category: "Pokemon", owner_id: @marc_coll.id, api_name: "Pokemon")
      @bulb = Card.create(name: "Bulbasaur", count: 1, brand_id: @marc_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base1/44.jpg")
      @char = Card.create(name: "Charmander", count: 3, brand_id: @marc_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base1/46.jpg") 
      @squirt = Card.create(name: "Squirtle", count: 1, brand_id: @marc_poke.id, image_url:  "https://s3.amazonaws.com/pokemontcg/base1/63.jpg")
      @deck = Deck.create(name: "Marc's Starters")
      @cd1 = CardDeck.create(card_id: @bulb.id, deck_id: @deck.id, card_count: 1)
      @cd2 = CardDeck.create(card_id: @squirt.id, deck_id: @deck.id, card_count: 1)
      @cd3 = CardDeck.create(card_id: @char.id, deck_id: @deck.id, card_count: 3)
  end

  def do_other_things
    @laura = User.create(user_name: "lshapz", password: "password")
    @laura_coll = Owner.create(name: @laura.user_name, user_id: @laura.id)
    @laura_poke = Brand.create(category: "Pokemon", owner_id: @laura_coll.id, api_name: "Pokemon")
    @psyduck = Card.create(name: "Psyduck", count: 20, brand_id: @laura_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base5/65.jpg")
    @deck2 = Deck.create(name: "Duck")
    @cd4 = CardDeck.create(card_id: @psyduck.id, deck_id: @deck2.id, card_count: 15)
  end 

end


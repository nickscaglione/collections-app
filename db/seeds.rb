# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

laura = User.create(user_name: "lshapz", password: "password")
nick = User.create(user_name: "nas1", password: "password")
marc = User.create(user_name: "immediato", password: "password")

laura_coll = Owner.create(name: laura.user_name, user_id: laura.id)
nick_coll = Owner.create(name: nick.user_name, user_id: nick.id)
marc_coll = Owner.create(name: marc.user_name, user_id: marc.id)

marc_magic = Brand.create(category: "Magic the Gathering", owner_id: marc_coll.id, api_name: "MTG")
nick_poke = Brand.create(category: "Pokemon", owner_id: nick_coll.id, api_name: "Pokemon")
laura_poke = Brand.create(category: "Pokemon", owner_id: laura_coll.id, api_name: "Pokemon")
marc_poke = Brand.create(category: "Pokemon", owner_id: marc_coll.id, api_name: "Pokemon")

Card.create(name: "Pikachu", count: 1, brand_id: nick_poke.id, image_url:  "https://s3.amazonaws.com/pokemontcg/base1/58.jpg")
Card.create(name: "Pikachu", count: 1, brand_id: laura_poke.id, image_url:  "https://s3.amazonaws.com/pokemontcg/base1/58.jpg")
Card.create(name: "Psyduck", count: 1, brand_id: laura_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base5/65.jpg")
Card.create(name: "Phage", count: 1, brand_id: marc_magic.id, image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=40545&type=card")
Card.create(name: "Swamp", count: 20, brand_id: marc_magic.id, image_url: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=417831&type=card")
Card.create(name: "Cubone", count: 1, brand_id: nick_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base2/50.jpg")
Card.create(name: "Zubat", count: 20, brand_id: laura_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base5/70.jpg")
Card.create(name: "Geodude", count: 4, brand_id: nick_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base3/47.jpg")
Card.create(name: "Bulbasaur", count: 1, brand_id: marc_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base1/44.jpg")
Card.create(name: "Charmander", count: 3, brand_id: marc_poke.id, image_url: "https://s3.amazonaws.com/pokemontcg/base1/46.jpg") 
Card.create(name: "Squirtle", count: 1, brand_id: marc_poke.id, image_url:  "https://s3.amazonaws.com/pokemontcg/base1/63.jpg")

Deck.create(name: "Marc's Starters") 
CardDeck.create(card_id: 9, deck_id: 1, card_count: 1)
CardDeck.create(card_id: 10, deck_id: 1, card_count: 1)
CardDeck.create(card_id: 11, deck_id: 1, card_count: 1)
Deck.create(name: "Laura's Bats")
CardDeck.create(card_id: 7, deck_id: 2, card_count: 10)

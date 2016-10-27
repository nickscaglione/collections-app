# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

laura = User.create(user_name: "lshapz")
nick = User.create(user_name: "nas1")
marc = User.create(user_name: "immediato")

laura_coll = Collector.create(name: laura.user_name, user: laura)
nick_coll = Collector.create(name: nick.user_name, user: nick)
marc_coll = Collector.create(name: marc.user_name, user: marc)

marc_magic = Collection.create(type: "Magic the Gathering", collector: marc_coll)
nick_poke = Collection.create(type: "Pokemon", collector: nick_coll)
laura_poke = Collection.create(type: "Pokemon", collector: laura_coll)
marc_poke = Collection.create(type: "Pokemon", collector: marc_coll)

Card.create(name: "Pikachu", count: 1, collection: nick_poke)
Card.create(name: "Pikachu", count: 1, collection: laura_poke)
Card.create(name: "Psyduck", count: 1, collection: laura_poke)
Card.create(name: "Phage", count: 1, collection: marc_magic)
Card.create(name: "Swamp", count: 20, collection: marc_magic)
Card.create(name: "Cubone", count: 1, collection: nick_poke)
Card.create(name: "Zubat", count: 20, collection: laura_poke)
Card.create(name: "Geodude", count: 4, collection: nick_poke)
Card.create(name: "Bulbasaur", count: 1, collection: marc_poke)
Card.create(name: "Charmander", count: 1, collection: marc_poke)
Card.create(name: "Squirtle", count: 1, collection: marc_poke)

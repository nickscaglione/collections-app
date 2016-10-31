require 'pokemon_tcg_sdk'
require 'byebug'

class PokemonCards

  def self.find_card(card_name)
    #cards = Pokemon::Card.where(set_code: 'base1').where(set: 'Base').where(name: card_name).where(series: 'Base').all
    
    # cards.each do |x| 
    cards = Pokemon::Card.where(name: card_name).all#   puts x.name
    
    cards_array = cards.each_with_object([]) do |card, card_array|
      card_array << [card.name, card.image_url]
    end 

  end 

end 
# Pokemon.find_card('Pikachu')

#https://github.com/PokemonTCG/pokemon-tcg-sdk-ruby for more card methods
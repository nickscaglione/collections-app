require 'pokemon_tcg_sdk'
require 'byebug'

class PokemonCards

  def self.find_card(card_name, year_min = 1996, year_max = 2016)
    #cards = Pokemon::Card.where(set_code: 'base1').where(set: 'Base').where(name: card_name).where(series: 'Base').all
    
    # cards.each do |x| 
    cards = Pokemon::Card.where(name: card_name).all#   puts x.name
    
    cards_array = cards.each_with_object([]) do |card, card_array|
      card_array << [card.name, card.image_url, PokemonCards.find_set_year(card.set)]
    end 

    cards_array.reject {|card| card.last < year_min || card.last > year_max}

  end 



  def self.find_set_year(set_name)
    set = Pokemon::Set.where(name: set_name).all.first
    set.release_date.split("/").last.to_i
  end 

end 
# Pokemon.find_card('Pikachu')

#https://github.com/PokemonTCG/pokemon-tcg-sdk-ruby for more card methods
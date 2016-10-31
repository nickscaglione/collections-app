require 'pokemon_tcg_sdk'
require 'byebug'

class PokemonCards

  def self.find_card(card_name)
    cards = Pokemon::Card.where(set_code: 'base1').where(set: 'Base').where(name: card_name).where(series: 'Base').all
    cards.each do |x| 
      puts x.name
      puts x.image_url
      puts x.id
      puts x.national_pokedex_number
    end
    
  end 

end 
# Pokemon.find_card('Pikachu')

#https://github.com/PokemonTCG/pokemon-tcg-sdk-ruby for more card methods
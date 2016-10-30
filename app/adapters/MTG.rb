require 'mtg_sdk'
require 'byebug'

class MagicTheGathering

  def find_card(card_name)
    cards = MTG::Card.where(name: card_name).all
    cards.each do |card|
      puts card.name
      puts card.image_url
      puts card.set
    end 

  end


end 

find_card("Swamp")

# https://github.com/MagicTheGathering/mtg-sdk-ruby for more card methods
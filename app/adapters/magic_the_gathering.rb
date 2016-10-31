require 'mtg_sdk'
require 'byebug'

class MagicTheGathering

  def self.find_card(card_name, year_min = 1996, year_max = 2016)
    cards = MTG::Card.where(name: card_name).all
    #.where(set: "KLD").all

    cards_array = cards.each_with_object([]) do |card, card_array|
      card_array << [card.name, card.image_url, MagicTheGathering.set_years[card.set_name]]
    end

    cards_array.reject {|card| card.last < year_min || card.last > year_max}
  end

  def self.find_set_year(set_name)
    set = MTG::Set.find(set_name)
    set.release_date.split("-").first.to_i
  end

  def self.set_years
    @set_years ||= MTG::Set.all.each_with_object({}) do |set, set_year_hash|
      set_year_hash[set.name] = set.release_date.split("-").first.to_i
    end
  end

end

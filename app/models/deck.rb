class Deck < ApplicationRecord
  has_many :card_decks, dependent: :destroy
  has_many :cards, through: :card_decks, dependent: :destroy
  # belongs_to :brand, through: :cards
  # belongs_to :owner, through: :cards
  #validate :car
  
def brand
  self.cards.first.brand
end

def owner
  self.brand.owner
end

def cards_with_count
  cards = []
  self.card_decks.each do |card_deck|
    card = Card.find(card_deck.card_id)
    count = card_deck.card_count
    cards << [count, card]
  end
    cards
  end

end

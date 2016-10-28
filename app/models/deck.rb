class Deck < ApplicationRecord
  has_many :card_decks 
  has_many :cards, through: :card_decks
  # belongs_to :brand, through: :cards
  # belongs_to :owner, through: :cards
  #validate :car
  
def brand
  self.cards.first.brand
end

def owner
  self.brand.owner
end

end

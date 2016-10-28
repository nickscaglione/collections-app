class Deck < ApplicationRecord
  has_many :card_decks 
  has_many :cards, through: :card_decks
  has_one :collection, through: :cards
  has_one :owner, through: :collection
  #validate :car
  
end

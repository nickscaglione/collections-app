class Deck < ApplicationRecord
  has_many :card_decks 
  has_many :cards, through: :card_decks
  belongs_to :collection
  has_one :owner, through: :collection
  #validate :car
  
end

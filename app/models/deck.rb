class Deck < ApplicationRecord
  has_many :card_decks 
  has_many :cards, through: :card_decks
  belongs_to :brand
  has_one :owner, through: :brand
  #validate :car
  
end

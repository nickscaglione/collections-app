class CardDeck < ApplicationRecord
  belongs_to :card
  belongs_to :deck
  has_one :owner, through: :card 
  has_one :brand, through: :card 

  # def card

  # end

  # def deck

    
end



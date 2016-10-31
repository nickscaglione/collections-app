class Card < ApplicationRecord
  belongs_to :brand
  has_many :card_decks
  has_one :owner, through: :brand
  has_many :decks, through: :card_decks


end

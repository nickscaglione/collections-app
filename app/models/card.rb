class Card < ApplicationRecord
  belongs_to :collection
  has_many :card_decks
  has_one :owner, through: :collection
  has_many :decks, through: :card_decks
end


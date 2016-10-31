class Card < ApplicationRecord
  belongs_to :brand
  has_many :card_decks
  has_one :owner, through: :brand
  has_many :decks, through: :card_decks

  validates :count, presence: true
  validates :count, numericality: { greater_than: 0 }

end

class Owner < ApplicationRecord
  has_one :user
  has_many :brands
  has_many :cards, through: :brands
  has_many :decks, through: :brands
end

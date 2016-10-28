class Owner < ApplicationRecord
  has_one :user
  has_many :brands
  has_many :cards, through: :brands
  has_many :decks, through: :brands

  def user
    user = User.find(self.user_id)
  end

  def decks
    decks = []
    self.brands.each do |brand|
      decks << brand.decks
    end
    decks.flatten!
  end

end

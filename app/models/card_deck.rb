class CardDeck < ApplicationRecord
  belongs_to :card
  belongs_to :deck
  has_one :owner, through: :card
  has_one :brand, through: :card

  validate :not_zero_or_nil?

  # def card

  # end

  # def deck

  def not_zero_or_nil?
    if self.card_count
      self.errors.add(:card_count, "cannot be zero") unless self.card_count > 0
    else
      self.errors.add(:card_count, "cannot be nil")
    end
  end

end

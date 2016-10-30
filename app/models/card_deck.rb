class CardDeck < ApplicationRecord
  belongs_to :card
  belongs_to :deck
  has_one :owner, through: :card
  has_one :brand, through: :card

  validate :not_zero_or_nil?
  validate :count_less_than_brand_count?

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

  def count_less_than_brand_count?
    if self.card_count
      self.errors.add(:card_count, "you don't have that many of this card") unless Card.find(card_id).count >= card_count
    end
  end

end

class Card < ApplicationRecord
  belongs_to :brand
  has_many :card_decks, dependent: :destroy
  has_one :owner, through: :brand
  has_many :decks, through: :card_decks

  validates :count, presence: true
  validates :count, numericality: { greater_than: 0 }
  validate :image_url?

  def image_url?
    self.errors.add("Card image:", "You must choose an image") unless self.image_url
  end

end

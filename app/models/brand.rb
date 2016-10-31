class Brand < ApplicationRecord
  has_many :cards
  belongs_to :owner
  has_many :card_decks
  has_many :decks
  validate :unique_category?

  attr_accessor :current_user

  def unique_category?
    if current_user
      if current_user.owner.brands.pluck(:category).include?(self.category)
        errors.add(self.category, "category already in use!")
      end
    end
  end

  def decks
    decks = []
    self.cards.each do |card|
      card.decks.each do |deck|
        decks << deck
      end
    end
    decks
  end

  # return the card in the brand that is featured in the most decks (number of times used in a deck not considered)
  def most_used_card
    sql = <<-SQL
      SELECT cards.id, MAX(cards.name) as name, MAX(cards.created_at) AS created_at, MAX(cards.updated_at) as updated_at, COUNT(cards.id) AS counter
      FROM cards
      LEFT JOIN card_decks ON cards.id = card_decks.card_id
      WHERE cards.brand_id = #{self.id}
      GROUP BY cards.id ORDER BY counter DESC LIMIT 1
    SQL
    Card.find_by_sql(sql).first
  end

end

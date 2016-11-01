class Brand < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :owner
  has_many :card_decks, dependent: :destroy
  has_many :decks, dependent: :destroy
  validate :unique_category?, on: :update
  validate :uniquer_category?, on: :create

  attr_accessor :current_user

  # def api
  #   if brand.api_id == 1
  #     brand.api = "Pokemon"
  #   elsif brand.api_id == 2
  #     brand.api = "Magic The Gathering"
  #   end
  # end

  def uniquer_category?
    if current_user
      used_brands = current_user.owner.brands.pluck(:category)
      if used_brands.include?(self.category)
        errors.add(self.category, "category already in use!")
      end
    end
  end

  def unique_category?
    if current_user
      used_brands = current_user.owner.brands.pluck(:category) - [Brand.find(self.id).category]
      if used_brands.include?(self.category)
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
    decks.uniq
  end


  # return the card in the brand that is featured in the most decks (number of times used in a deck not considered)
  def most_used_card
    sql = <<-SQL
      SELECT cards.id, MAX(cards.name) as name, MAX(cards.image_url) as image_url, MAX(cards.created_at) AS created_at, MAX(cards.updated_at) as updated_at, COUNT(cards.id) AS counter
      FROM cards
      LEFT JOIN card_decks ON cards.id = card_decks.card_id
      WHERE cards.brand_id = #{self.id}
      GROUP BY cards.id ORDER BY counter DESC LIMIT 1
    SQL
    # find_by_sql returns an array
    Card.find_by_sql(sql).first
  end

end

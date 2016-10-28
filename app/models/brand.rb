class Brand < ApplicationRecord
  has_many :cards
  belongs_to :owner
  has_many :card_decks
  has_many :decks



  validate :unique_category?

  attr_accessor :current_user

  def unique_category?
    if current_user
      if current_user.owner.collections.pluck(:category).include?(self.category)
        errors.add(self.category, "category already in use!")
      end
    end 
  end
end

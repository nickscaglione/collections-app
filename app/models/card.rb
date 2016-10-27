class Card < ApplicationRecord
  belongs_to :collection
  validate :unique_card?
  attr_accessor :current_user



  def unique_card?
    if current_user.owner.collections.cards.pluck(:name).include?(self.name)
      errors.add(self.name, "you already have one of those - try editing it and updating the count!")
    end
  end
end

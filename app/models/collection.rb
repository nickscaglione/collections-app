class Collection < ApplicationRecord
  has_many :cards
  belongs_to :owner
  validate :unique_category?

  attr_accessor :current_user

  def unique_category?
    if current_user.owner.collections.pluck(:category).include?(self.category)
      errors.add(self.category, "category already in use!")
    end
  end
end

class Collection < ApplicationRecord
  has_many :cards
  belongs_to :user
end

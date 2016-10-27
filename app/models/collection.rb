class Collection < ApplicationRecord
  has_many :cards
  belongs_to :collector
end

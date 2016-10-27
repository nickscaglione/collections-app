class Collector < ApplicationRecord
  has_one :user
  has_many :collections
  has_many :cards, through: :collections
end

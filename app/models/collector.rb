class Collector < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :cards, through: :collections

end

class User < ApplicationRecord
  has_many :collections
  has_many :cards, through: :collections
end

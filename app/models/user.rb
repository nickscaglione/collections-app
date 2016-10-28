class User < ApplicationRecord
  has_secure_password 
  belongs_to :owner
  validates :user_name, uniqueness: true

end

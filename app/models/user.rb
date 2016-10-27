class User < ApplicationRecord
  has_secure_password
  
  has_one :owner
  validates :user_name, uniqueness: true

end

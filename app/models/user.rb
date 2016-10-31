class User < ApplicationRecord
  has_secure_password 
  # belongs_to :owner
  validates :user_name, uniqueness: true
attr_accessor :owner

 def capitalize
    self[:user_name].capitalize 
  end

  def owner
    Owner.find_by(user_id: self.id)
  end

end

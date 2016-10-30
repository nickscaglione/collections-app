require 'rails_helper'
require 'byebug'
RSpec.describe User, type: :model do

  let (:user) {User.create(user_name: 'bob', password: 'password')}
  let (:owner) {Owner.create(name: 'bob', user_id: user.id)}

  describe "#capitalize" do
    it 'capitalizes a user name' do
      expect(user.capitalize).to eq('Bob')
    end
  end

  describe "#owner" do
    it 'can find the owner from the given user' do 
      user
      owner
      expect(user.owner).to eq(owner)
    end 
  end


end

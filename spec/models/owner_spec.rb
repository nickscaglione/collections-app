require 'rails_helper'

RSpec.describe Owner, :type => :model do

  let (:user) {User.create(user_name: 'bob', password: 'password')}
  let (:owner) {Owner.create(name: 'bob', user_id: user.id)}


  describe "#user" do
    it 'can find the user from the given owner' do 
      user
      owner
      expect(owner.user).to eq(user)
    end 
  end


end

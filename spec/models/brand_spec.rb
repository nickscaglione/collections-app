require 'rails_helper'

RSpec.describe Brand, :type => :model do


describe "#decks" do 
  it "can identify the decks associated with itself" do 
    do_things
    expect(@marc_poke.decks).to include(@deck)
  end
end



end

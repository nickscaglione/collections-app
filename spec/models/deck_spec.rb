require 'rails_helper'

RSpec.describe Deck, :type => :model do

describe "#brand" do 
  it "can identify the brand associated with itself" do 
    do_things
    expect(@deck.brand).to eq(@marc_poke)
  end
end


describe "#owner" do 
  it "can identify the owner associated with itself" do 
    do_things
    expect(@deck.owner).to eq(@marc_coll)
  end
end



describe "#cards_with_count" do 
  it "can identify the owner associated with itself" do 
    do_things
    expect(@deck.cards_with_count).to include([1, @char])
    expect(@deck.cards_with_count).to include([1, @bulb])
    expect(@deck.cards_with_count).to include([1, @squirt])
  end
end




end

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
    yes = @deck.cards_with_count.select {|card| card == [@char, 3]}
    no = @deck.cards_with_count.select {|card| card == [@char, 1]}
    # byebug 
    expect(yes).to be
    expect(no.empty?).to be
  end
end




end

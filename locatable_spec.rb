require 'rspec'
require 'pry'
require './treasure'

RSpec.describe Locatable do
  it "can find distances" do
    s = Treasure.new({lat: 10, lon: -33})
    expect(s.distance_to 10, -33).to eq 0
    expect(s.distance_to 10, -34).to be < 10000 # ??
  end

end

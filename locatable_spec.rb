require 'rspec'
require 'pry'
require './station'
require 'haversine'


RSpec.describe Locatable do
  let(:station) { Station.new(lat:10, lon: -33) }
  let(:nearby_station) { Station.new(lat: 11, lon: -34) }
  let(:faraway_station) { Station.new(lat: 50, lon: 50) }

  def distance *args
    Haversine.distance( *(args) ).great_circle_distance
  end

  it "can find distances" do
    s1 = station
    s2 = nearby_station
    expect( s1.distance_to({lat: 10, lon: -33}) ).to eq 0

    x = s1.distance_to({lat: 11, lon: -34})
    y = distance(
                 s1.latitude, s1.longitude,
                 s2.latitude, s2.longitude
    )

    expect( x == y ).to be_truthy
  end

  it "can find closest stations" do

    s = Station.closest_to 10, -34

    expect(s.latitude ).to eq  10
    expect(s.longitude).to eq -33
  end




end

require_relative './locatable'

class Treasure
  include Locatable

  attr_reader :latitude, :longitude

  def initialize options={}
    @latitude =     options[:lat]
    @longitude =    options[:lon]
  end

  def self.all
    [
      Station.new(12, -36),
      Station.new(10, -33),
      Station.new(77,  45)
    ]
  end
end

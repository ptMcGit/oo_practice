require './locatable'

class CoordinateThingey
  include Locatable
  attr_reader :latitude, :longitude
  attr_accessor :nearby_things

  def initialize options={}
    @latitude       =   options[:lat]
    @longitude      =   options[:lon]
    @nearby_things  =   {}
    post_initialize
  end

  def to_s
    self.class.to_s.downcase
  end

  def coordinates
    [self.latitude, self.longitude]
  end

  def distance_to lat, lon
    Haversine.distance( *([lat , lon] + self.coordinates) ).
      great_circle_distance
  end

end

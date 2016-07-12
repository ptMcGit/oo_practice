require 'haversine'

module Locatable

  def distance_to options={}
    coordinates = options.values + [self.latitude, self.longitude]
    h = Haversine.distance( *(coordinates) )
    h.great_circle_distance
  end


end

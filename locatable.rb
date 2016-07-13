require 'haversine'

module Locatable

  def self.included other
    other.extend Locatable::ClassMethods
  end



#  def distance_to *args
#    Haversine.distance( *(args + self.coordinates) ).
#      great_circle_distance
#  end

  module ClassMethods

    def get_nearby thingey
      binding.pry
      if x = thingey.nearby_things[self.to_s]
        return x
      end
      get_nearby! thingey
    end

    def to_s
      self.class.to_s.downcase
    end

    def get_nearby! thingey
      self.all.each do |other|
        h["load"] = other
        h["distance"] = thingey.distance_to( *(other.coordinates) )
        thingey.nearby_things[self.to_s].push h
      end
    end
  end

end

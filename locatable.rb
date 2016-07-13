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

    def order_by_closest thingey
      thingey.nearby_things = []
      self.all.each do |other|
        h = Hash.new
        h[self.class.to_s.downcase] = other
        h["distance"] = thingey.distance_to( *(other.coordinates) )
        thingey.nearby_things.push h
        binding.pry
      end
    end

  end

end

require_relative './coordinate_thingey'

class Station < CoordinateThingey

  attr_reader :says

  def post_initialize
    @says = 'whoop whoop'
  end

  def self.all
    [
      Station.new(lat: 12, lon: -36),
      Station.new(lat: 10, lon: -33),
      Station.new(lat: 77, lon:  45)
    ]
  end
end

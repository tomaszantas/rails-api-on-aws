class Place < ApplicationRecord

  def self.geo_factory
    @geo_factory ||= RGeo::Geographic.spherical_factory(srid: 4326)
  end
  
end

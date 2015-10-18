class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true

  geocoded_by :location, :latitude  => :lat, :longitude => :lng do |obj,results|
    if geo = results.first
      obj.location = geo.formatted_address
      obj.lat = geo.latitude
      obj.lng = geo.longitude
    end
  end

  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end

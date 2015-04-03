class Location < ActiveRecord::Base
  include Concerns::RailsAdmin::Location
  belongs_to :vendor, inverse_of: :locations
  has_many :posts
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  def self.get_location_nearest(latitude, longitude)
    @filter_locations = []
    @locations = Location.all
    @locations.each do |location|
      if self.get_distance_from_lat_lon_in_km(location.latitude.to_f, location.longitude.to_f, latitude, longitude) <= 1
        @filter_locations << ApiHelper.format_data_locations(location)

      end
    end
    return @filter_locations
  end

  def self.get_distance_from_lat_lon_in_km(lat1,lon1,lat2,lon2)
    earth_radius = 6371
    dLat = self.deg2rad(lat2-lat1);
    dLon = self.deg2rad(lon2-lon1);
    a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
        Math.sin(dLon/2) * Math.sin(dLon/2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    distance = earth_radius * c

    if distance < 0
      return -distance
    end
    return distance
  end

  def self.deg2rad(deg)
    return deg * (Math::PI/180)
  end
end

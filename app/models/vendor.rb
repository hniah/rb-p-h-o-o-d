class Vendor < User
  include Concerns::RailsAdmin::Vendor
  geocoded_by :address   # can also be an IP address
  after_validation :geocode
end

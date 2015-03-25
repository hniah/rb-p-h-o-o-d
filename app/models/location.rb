class Location < ActiveRecord::Base
  include Concerns::RailsAdmin::Location
  belongs_to :vendor, inverse_of: :locations
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
end

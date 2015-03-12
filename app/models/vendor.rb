class Vendor < User
  include Concerns::RailsAdmin::Vendor
  has_one :data_vendor, dependent: :destroy
  has_many :suggestions
  has_many :posts, dependent: :destroy
  geocoded_by :address   # can also be an IP address
  after_validation :geocode
  accepts_nested_attributes_for :data_vendor

end

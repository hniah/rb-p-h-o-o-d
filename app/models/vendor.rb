class Vendor < User
  include Concerns::RailsAdmin::Vendor
  has_many :suggestions
  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true
end

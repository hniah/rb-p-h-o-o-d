class Vendor < User
  include Concerns::RailsAdmin::Vendor
  has_many :suggestions
  has_many :posts, dependent: :destroy
end

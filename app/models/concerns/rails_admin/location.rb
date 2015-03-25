module Concerns::RailsAdmin::Location
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :address
        field :latitude
        field :longitude
      end
    end
  end
end

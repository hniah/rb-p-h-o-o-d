module Concerns::RailsAdmin::Vendor
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :email
        field :password
        field :password_confirmation
        field :name
        field :description
        field :address
        field :phone
        field :fax
        field :longitude
        field :latitude
      end

      list do
        field :id
        field :email
        field :name
        field :address
        field :phone
      end

      show do
        field :id
        field :email
        field :name
        field :address
        field :phone
        field :fax

        field :description
        field :longitude
        field :latitude
      end
    end
  end
end

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
        field :phone
        field :fax
        field :reward_detail
        field :picture
        field :locations
      end

      list do
        field :id
        field :email
        field :name
        field :phone
      end

      show do
        field :id
        field :email
        field :name
        field :phone
        field :fax
        field :description
      end
    end
  end
end

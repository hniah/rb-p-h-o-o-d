module Concerns::RailsAdmin::User
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :email
        field :password do
          required false
        end
        field :password_confirmation
        field :name
        field :description
        field :phone
        field :fax
        field :type
      end

      list do
        field :id
        field :email
        field :name
        field :phone
        field :type
      end

      show do
        field :id
        field :email
        field :name
        field :phone
        field :fax

        field :description
        field :type
      end
    end
  end
end

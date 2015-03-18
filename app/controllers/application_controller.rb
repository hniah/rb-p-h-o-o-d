class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home

  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      rails_admin_path
    else
      root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :name , :description, :address, :phone, :fax, :longitude, :latitude, :picture, :password_confirmation, :current_password)
    end
  end
end

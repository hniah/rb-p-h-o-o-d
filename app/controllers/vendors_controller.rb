class VendorsController < ApplicationController
  before_action :authenticate_user!, :admin_can_not_access

  def show
    @vendor = current_user
    @total_sharing = Post.where('location_id IN (?)', @vendor.locations.select('id')).count
    @locations = @vendor.locations
    render :dashboard
  end

  def sharing
    @vendor = current_user
    @shares = Post.where('location_id IN (?)', @vendor.locations.select('id')).page params[:page]
  end

  private
  def admin_can_not_access
    if current_user.is_a?(Admin)
      redirect_to rails_admin_path
    end
  end
end

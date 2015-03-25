class VendorsController < ApplicationController
  before_action :authenticate_user!, :admin_can_not_access

  def show
    @vendor = current_user
    @total_sharing = Post.where(vendor_id: @vendor.id).count
    @locations = @vendor.locations
    render :dashboard
  end

  def sharing
    @shares = Post.where(vendor_id: current_user.id).page params[:page]
  end

  private
  def admin_can_not_access
    if current_user.is_a?(Admin)
      redirect_to rails_admin_path
    end
  end
end

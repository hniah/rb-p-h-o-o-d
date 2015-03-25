class VendorsController < ApplicationController
  before_action :authenticate_user!

  def show
    @vendor = current_user
    @total_sharing = Post.where(vendor_id: @vendor.id).count
    @locations = @vendor.locations
    render :dashboard
  end

  def sharing
    @shares = Post.where(vendor_id: current_user.id).page params[:page]
  end
end

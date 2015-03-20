class VendorsController < ApplicationController
  before_action :authenticate_user!

  def sharing
    @shares = Post.where(vendor_id: current_user.id)
  end
end

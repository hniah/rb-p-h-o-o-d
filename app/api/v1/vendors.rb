module V1
  class Vendors < Grape::API
    resource :vendors do
      desc 'List all of Vendor'

      get do
        vendors = Vendor.all
        vendors_filter = []
        vendors.each do |vendor|
          vendors_filter << ApiHelper.filter_vendor(vendor)
        end
        ApiHelper.response(200, '', vendors_filter)
      end

      desc 'Get locations nearest in 1 kilometer'
      params do
        requires :latitude, type: Float
        requires :longitude, type: Float
      end
      get 'locations' do
        @location = Location.get_location_nearest(params[:latitude],params[:longitude])
        ApiHelper.response(200, '', @location)
      end
    end
  end
end

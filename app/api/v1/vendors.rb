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
    end
  end
end

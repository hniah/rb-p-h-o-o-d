module V1
  class Vendors < Grape::API
    resource :vendors do
      desc 'List all of Vendor'

      get do
        ApiHelper.response(200, '', Vendor.all)
      end
    end
  end
end

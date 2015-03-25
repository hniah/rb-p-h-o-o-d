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


      desc 'Get reward of vendor'
      params do
        requires :id, type: Integer
      end
      get ':id/reward' do

        data = Vendor.find(params[:id])
        if data.present?
          ApiHelper.response(200, '', ApiHelper.filter_reward_vendor(data))
        else
          ApiHelper.response(404, 'Not found')
        end
      end
    end
  end
end

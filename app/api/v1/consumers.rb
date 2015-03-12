module V1
  class Consumers < Grape::API
    resource :consumer do
      desc 'Create a new consumer'

      params do
        requires :email, type:String
        requires :device_token, type:String
      end

      post do
        consumer = Consumer.new({
            name:params[:name],
            email:params[:email],
            device_token:params[:device_token],
            platform:params[:platform]
        })
        if consumer.save
          ApiHelper.response(200, 'Consumer has inserted successfully')
        else
          ApiHelper.response(500, 'Consumer has inserted unsuccessfully')
        end
      end
    end
  end
end

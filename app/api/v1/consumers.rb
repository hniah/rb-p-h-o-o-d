module V1
  class Consumers < Grape::API
    resource :consumer do
      desc 'Store consumer social post'

      params do
        requires :location_id, type:String
        requires :message, type:String
        requires :social_type, type:String
        requires :platform, type:String
        requires :device_token, type:String
      end

      post 'social' do
        consumer = Consumer.find_by_device_token(params[:device_token])
        unless consumer.present?
          consumer = Consumer.create(
                        device_token:params[:device_token],
                        platform:params[:platform]
                    )
        end

        post = Post.new(
            consumer_id: consumer.id,
            location_id:  params[:location_id],
            message:      params[:message],
            social_type:  params[:social_type],
        )

        if params[:picture].present?
          post.picture = params[:picture][:tempfile]
          post.picture_file_name = params[:picture][:filename]
        end

        if post.save
          ApiHelper.response(200, 'Post was inserted successfully', Location.find(params[:location_id]).vendor.reward_detail)
        else
          ApiHelper.response(500, 'Post was inserted unsuccessfully')
        end

      end

    end
  end
end

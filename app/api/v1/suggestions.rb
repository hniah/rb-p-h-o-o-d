module V1
  class Suggestions < Grape::API
    resource :suggestion do
      desc 'Create a new suggest'

      params do
        requires :consumer_name, type: String
        requires :merchant_name, type: String
        requires :merchant_location, type: String
        requires :message, type:String
      end

      post do
        suggestion = Suggestion.new(
            consumer_name:params[:consumer_name],
            merchant_name:params[:merchant_name],
            merchant_location:params[:merchant_location],
            message:params[:message],
        )
        if suggestion.save
          ApiHelper.response(200, 'Suggestion has inserted successfully')
        else
          ApiHelper.response(500, 'Suggestion has inserted unsuccessfully')
        end
      end
    end
  end
end

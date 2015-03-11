module V1
  class Suggestions < Grape::API
    resource :suggestion do
      desc 'Create a new suggest'

      params do
        requires :name, type: String
        requires :message, type:String
        requires :vendor_id, type:Integer
      end

      post do
        suggestion = Suggestion.new({
            name:params[:name],
            message:params[:message],
            vendor_id:params[:vendor_id]
        })
        if suggestion.save
          ApiHelper.response(200, 'Suggestion has inserted successfully')
        else
          ApiHelper.response(500, 'Suggestion has inserted unsuccessfully')
        end
      end
    end
  end
end

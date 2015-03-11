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
        Suggestion.create({
            name:params[:name],
            message:params[:message],
            vendor_id:params[:vendor_id]
        })
      end
    end
  end
end

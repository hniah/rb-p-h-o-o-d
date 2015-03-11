class API < Grape::API
  before do
    error!('Invalid API key', 401) if params[:api_key] != ENV['API_KEY']
  end
  prefix 'api'
  version 'v1', using: :path
  format :json
  mount V1::Vendors
end

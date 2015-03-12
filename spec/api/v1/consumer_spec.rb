require 'rails_helper'

RSpec.describe V1::Consumers do
  describe 'POST /consumer' do
    let(:error_code) { JSON.parse(response.body)['error_code'] }

    it 'return error_code is 200' do
      post '/api/v1/consumer?api_key='+ENV['API_KEY']+'&name=Anthony&email=consumer@example.com&device_token=837362&platform=android'

      expect(Consumer.first.email).to eq 'consumer@example.com'
      expect(error_code).to eq 200
    end
  end
end

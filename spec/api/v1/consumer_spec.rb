require 'rails_helper'

RSpec.describe V1::Consumers do
  describe 'POST /consumer' do
    let(:error_code) { JSON.parse(response.body)['error_code'] }
    let(:consumer) { create :consumer}
    context 'Consumer does exited' do
      it 'return error_code is 200' do
        post '/api/v1/consumer', {api_key: ENV['API_KEY'], name: consumer.name, email: consumer.email, device_token:consumer.device_token, platform: consumer.platform}
        expect(Consumer.first.email).to eq consumer.email
        expect(error_code).to eq 200
      end
    end

    context 'Consumer does not exited' do
      it 'return error_code is 200' do
        post '/api/v1/consumer', {api_key: ENV['API_KEY'], name: 'Anthony', email: 'consumer@example.com', device_token:32132, platform: 'android'}
        expect(Consumer.first.email).to eq 'consumer@example.com'
        expect(error_code).to eq 200
      end
    end
  end

  describe 'POST /social' do
    let(:reward) { JSON.parse(response.body)['data'] }
    let!(:vendor) { create :vendor}

    it 'return reward of vendor' do
      post '/api/v1/consumer/social', {api_key: ENV['API_KEY'], location_id:vendor.locations.first.id,  message: 'What do you think', social_type: :facebook, picture: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test-small.png'), 'images/png'), device_token:'321323213213', platform: 'andriod'}

      expect(Post.first.message).to eq 'What do you think'
      expect(reward).to eq vendor.reward_detail
    end
  end
end

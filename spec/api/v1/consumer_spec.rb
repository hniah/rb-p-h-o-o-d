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
    let!(:consumer) { create :consumer}
    let!(:vendor) { create :vendor}

    it 'return reward of vendor' do
      post '/api/v1/consumer/social', {api_key: ENV['API_KEY'], consumer_id: consumer.id, vendor_id: vendor.id, message: 'Testing post', social_type: :facebook}

      expect(Post.first.message).to eq 'Testing post'
      expect(reward['reward_detail']).to eq vendor.data_vendor.reward_detail
    end
  end
end

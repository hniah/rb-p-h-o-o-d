require 'rails_helper'

RSpec.describe V1::Consumers do

  describe 'POST /social' do
    let(:reward) { JSON.parse(response.body)['data'] }
    let!(:vendor) { create :vendor}

    it 'return reward of vendor' do
      post '/api/v1/consumer/social', {api_key: ENV['API_KEY'], location_id:vendor.locations.first.id,  message: 'What do you think', social_type: :facebook, picture: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test-small.png'), 'images/png'), device_token:'321323213213', platform: 'andriod'}

      expect(Post.first.message).to eq 'What do you think'
      expect(reward['reward_detail']).to eq vendor.reward_detail
    end
  end
end

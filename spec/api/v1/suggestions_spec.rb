require 'rails_helper'

RSpec.describe V1::Suggestions do
  describe 'POST /suggestion' do
    let!(:vendor)    { create(:vendor) }
    let(:error_code) { JSON.parse(response.body)['error_code'] }

    it 'return error_code is 200' do
      post '/api/v1/suggestion', { api_key: ENV['API_KEY'], name: 'Anthony', message:'Lorem', vendor_id:vendor.id}
      expect(Suggestion.first.name).to eq 'Anthony'
      expect(error_code).to eq 200
    end
  end
end

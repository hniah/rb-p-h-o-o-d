require 'rails_helper'

RSpec.describe V1::Vendors do
  describe 'GET /vendors' do
    let!(:vendors)    { create_list(:vendor, 3) }
    let(:api_vendors) { JSON.parse(response.body)['data'] }

    it 'returns a list of vendor' do
      get '/api/v1/vendors'
      expect(api_vendors.count).to eq vendors.count
      expect(api_vendors.first['name']).to eq vendors.first.name
    end
  end
end

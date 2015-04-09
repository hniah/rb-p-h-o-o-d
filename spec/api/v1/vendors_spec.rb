require 'rails_helper'

RSpec.describe V1::Vendors do
  describe 'GET /vendors' do
    let!(:vendors)    { create_list(:vendor, 3) }
    let(:api_vendors) { JSON.parse(response.body)['data'] }

    it 'returns a list of vendor' do
      get '/api/v1/vendors', {api_key: ENV['API_KEY']}
      expect(api_vendors.count).to eq vendors.count
      expect(api_vendors.first['name']).to eq vendors.first.name
    end
  end


  describe 'GET /locations nearest in 1 kilometer' do
    let!(:vendors) { create_list(:vendor, 3) }
    let(:locations) { JSON.parse(response.body)['data'] }
    before do
      Location.create(latitude: '1.360439', longitude: '103.839415', vendor_id: vendors[0].id, name: 'Sin Ming Autocare Bfg', address: '176 Sin Ming Dr, #02-05 Sin Ming Autocare Complex, Singapore 575721')
      Location.create(latitude: '1.362069', longitude: '103.847162', vendor_id: vendors[0].id, name: 'The Canopy - Aramsa', address: '1382 Ang Mo Kio Avenue 1, Singapore 569931')
      Location.create(latitude: '1.364751', longitude: '103.835403', vendor_id: vendors[0].id, name: 'GRUB', address: '510 Ang Mo Kio Avenue 1, Singapore 569983')
      Location.create(latitude: '1.366081', longitude: '103.829674', vendor_id: vendors[0].id, name: 'Peirce Secondary School', address: '10 Sin Ming Walk, Singapore 575566')
      Location.create(latitude: '1.368140', longitude: '103.837506', vendor_id: vendors[0].id, name: 'Mellben Seafood', address: '232 Ang Mo Kio Avenue 3, Singapore 560233')
    end

    it 'return locations of vendors' do
      get '/api/v1/vendors/locations', {api_key: ENV['API_KEY'], latitude: '1.362412', longitude: '103.835896'}
      expect(locations.count).to eq 4
    end
  end
end

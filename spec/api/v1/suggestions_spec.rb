require 'rails_helper'

RSpec.describe V1::Suggestions do
  describe 'POST /suggestion' do
    let(:error_code) { JSON.parse(response.body)['error_code'] }

    it 'return error_code is 200' do
      post '/api/v1/suggestion', { api_key: ENV['API_KEY'], consumer_name: 'Anthony',merchant_name: 'Singapore food', merchant_location: '1382 Ang Mo Kio Avenue 1, Singapore 569931', message:'What do you think'}

      expect(Suggestion.first.consumer_name).to eq 'Anthony'
      expect(error_code).to eq 200
    end
  end
end

require 'rails_helper'

describe VendorsController do

  let(:vendor) { create :vendor}
  let(:consumer) { create :consumer}
  let!(:post) {Post.create(consumer_id:consumer.id, vendor_id: vendor.id, message: 'I like this food', social_type: 'facebook')}
  before do
    sign_in vendor
  end

  describe '#GET show vendor info' do
    def do_request
      get :show
    end

    it 'render vendor info' do
      do_request
      expect(response).to render_template :dashboard
      expect(assigns(:total_sharing)).to eq 1
      expect(assigns(:vendor)).to_not be_nil
    end
  end

  describe '#GET consumer_sharing' do
    def do_request
      get :sharing
    end

    it 'render list of consumer sharing' do
      do_request

      expect(response).to render_template :sharing
      expect(assigns(:shares)).to_not be_nil
    end
  end

end

require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  let!(:hotel) { create(:hotel) }

  describe 'GET #index' do
    before(:each) { get :index }

    it { expect(assigns(:hotels)).not_to be_empty }
    it { expect(assigns(:hotels).count).to eq(1) }
    it { expect(assigns(:hotels)).to include(hotel) }
    it { expect(response).to render_template :index }
  end

  describe 'GET #show' do
    before(:each) { get :show, params: { id: hotel.to_param } }

    it { expect(assigns(:hotel)).to eq(hotel) }
    it { expect(response).to render_template(:show) }
  end
end

require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let!(:room) { create(:room) }

  describe 'GET #index' do
    before(:each) { get :index }

    it { expect(assigns(:rooms)).not_to be_empty }
    it { expect(assigns(:rooms).count).to eq(1) }
    it { expect(assigns(:rooms)).to include(room) }
    it { expect(response).to render_template :index }
  end

  describe 'GET #show' do
    before(:each) { get :show, params: {id: room.to_param } }

    it { expect(assigns(:room)).to eq(room) }
    it { expect(response).to render_template(:show) }
  end
end

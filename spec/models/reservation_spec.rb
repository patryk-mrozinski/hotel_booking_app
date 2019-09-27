require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it 'should have valid factory' do
    expect(build(:reservation)).to be_valid
  end

  describe 'associations' do
    it { should belong_to :room }
  end

  describe 'methods for stripe payment' do
    let!(:room) { create(:room) }
    let!(:reservation) { create(:reservation, room: room) }
  end
end

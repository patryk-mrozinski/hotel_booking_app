require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:companies).dependent(:destroy) }
    it { should have_many(:hotels).through(:companies) }
    it { should have_many(:hotel_rooms).through(:hotels) }
    it { should have_many(:booked_rooms).dependent(:destroy) }
    it { should have_many(:rooms).through(:booked_rooms) }
  end
end

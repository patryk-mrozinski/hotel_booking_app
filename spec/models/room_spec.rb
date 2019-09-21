require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'should have valis factory' do
    expect(build(:room)).to be_valid
  end

  describe 'associations' do
    it { should belong_to :hotel }

    it { should have_many :booked_rooms }
    it { should have_many :reservations }

    it { should have_many(:users).through(:booked_rooms) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should validate_presence_of :number_of_guests }
  end
end

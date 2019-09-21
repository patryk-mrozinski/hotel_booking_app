require 'rails_helper'

RSpec.describe Hotel, type: :model do
  it 'should have valid factory' do
    expect(build(:hotel)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:rooms).dependent(:destroy) }
    it { should belong_to(:company) }
    it { should belong_to(:country) }
    it { should belong_to(:city) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :stars }
    it { should validate_presence_of :description }
  end
end

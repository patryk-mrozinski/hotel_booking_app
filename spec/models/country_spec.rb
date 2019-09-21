require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'should have valid factory' do
    expect(build(:country)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:cities).dependent(:destroy) }
    it { should have_many(:hotels) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :abbreviation }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_uniqueness_of(:abbreviation).case_insensitive }
  end
end

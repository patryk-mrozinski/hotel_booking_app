require 'rails_helper'

RSpec.describe City, type: :model do
  it 'should have valid factory' do
    expect(build(:city)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:hotels).dependent(:destroy) }
    it { should belong_to(:country) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :post_code }
  end
end

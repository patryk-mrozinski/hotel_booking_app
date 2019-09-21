require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should have valid factory' do
    expect(build(:company)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:hotels) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :p_number }
    it { should validate_presence_of :company_email }
    it { should validate_presence_of :address }
    it { should validate_presence_of :company_serial }

    it { should validate_length_of(:name).is_at_least(3) }
    # it { should validate_length_of(:p_number).is_at_least(3) }
    it { should validate_length_of(:company_email).is_at_least(3) }
    it { should validate_length_of(:address).is_at_least(3) }
    # it { should validate_length_of(:company_serial).is_at_least(3) }

    # it { should validate_uniqueness_of(:name).case_insensitive }
    # it { should validate_uniqueness_of(:company_email).case_insensitive }
  end
end

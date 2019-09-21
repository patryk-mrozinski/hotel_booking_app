FactoryBot.define do
  factory :company do
    user
    name { 'name1'}
    sequence(:company_email) { |n| "foo-#{n}@em1.com" }
    address { 'address' }
    company_serial { 123456 }
    p_number { 123455677 }
  end
end

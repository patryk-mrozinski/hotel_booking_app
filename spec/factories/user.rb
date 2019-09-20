FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo-#{n}@em.com" }
    password { 'password' }
  end
end

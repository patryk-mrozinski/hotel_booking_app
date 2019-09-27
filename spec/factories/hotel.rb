FactoryBot.define do
  factory :hotel do
    company
    country
    city
    name { 'Nice hotel' }
    stars { 3 }
    description { 'description' }
  end
end

FactoryBot.define do
  factory :room do
    hotel
    name { 'Double' }
    price { 10 }
    description { 'description' }
    number_of_guests { 2 }
  end
end

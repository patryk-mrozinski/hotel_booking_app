FactoryBot.define do
  factory :country do
    sequence(:name) { |n| "Party place #{n}"  }
    sequence(:abbreviation) { |n| "pp #{n}"  }
  end
end

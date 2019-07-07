FactoryBot.define do
  factory :table do
    association :admin, factory: :user
    name { Faker::Games::ElderScrolls.region }
    max_players { Faker::Number.number(2) }
    description { Faker::Lorem.paragraph_by_chars }
  end
end

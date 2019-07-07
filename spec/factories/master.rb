FactoryBot.define do
  factory :master do
    campaigns { Faker::Number.number(3) }
  end
end

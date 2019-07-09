FactoryBot.define do
  factory :master do
    user
    campaigns { Faker::Number.number(3) }
  end
end

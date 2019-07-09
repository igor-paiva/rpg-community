FactoryBot.define do
  factory :player do
    user
    campaigns { Faker::Number.number(3) }
  end
end

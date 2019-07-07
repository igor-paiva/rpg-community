FactoryBot.define do
  factory :player do
    campaigns { Faker::Number.number(3) }
  end
end

FactoryBot.define do
  factory :solicitation do
    user
    table

    trait :for_player do
      role { 'Player' }
    end

    trait :for_master do
      role { 'Master' }
    end
  end
end

FactoryBot.define do
  factory :user do
    name { Faker::TvShows::StrangerThings.character }
    email { Faker::Internet.email }
    nick_name { Faker::Internet.username }
    phone { Faker::PhoneNumber.cell_phone }
    twitter { Faker::Internet.username }
    instagram { Faker::Internet.username }
    description { Faker::Lorem.paragraph_by_chars }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

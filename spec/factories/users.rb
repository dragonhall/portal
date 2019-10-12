FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
    confirmed_at { Time.zone.now }
    registered_at { Time.zone.now }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    # user
    name { Faker::Name.name }
    homepage { Faker::Internet.url }
    facebook_url { "https://facebook.com/#{Faker::Internet.username}" }
    twitter_url { "https://twitter.com/#{Faker::Internet.username}" }
    birth_date { Faker::Date.birthday }
    address { Faker::Address.full_address }
    bio { Faker::Lorem.paragraph(sentence_count: 2) }
    signature { Faker::Lorem.paragraph(sentence_count: 1) }
    time_zone { ActiveSupport::TimeZone.all.collect(&:name).sample }
    locale { 'hu' }
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.any? and Group.any?
  admin_group = Group.create!(name: 'FullAdmin', color: 'FF3366', admin: true)
  admin_pw =  SecureRandom.base58(10)
  admin = User.create!(email: 'admin@dragonhall.hu', password: admin_pw, password_confirmation: admin_pw, registered_at: Time.now)
  admin.groups << admin_group
  admin.save

  puts "Admin email: #{admin.email}"
  puts "Admin pass:  #{admin_pw}"
end

if Rails.env.development?
  require 'factory_bot_rails'
  begin
    10.times do 
      user = FactoryBot.create :user
      FactoryBot.create :profile, user_id: user.id
      # TODO Add category/episode/datasheet fake data here
    end
  rescue
    puts "Fake data generation skipped"
  end
end

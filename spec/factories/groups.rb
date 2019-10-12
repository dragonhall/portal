FactoryBot.define do
  factory :group do
    name { Faker::Games::ElderScrolls.dragon.downcase.gsub(' ', '_').camelize }
    releaser { false }
    editor { false }
    admin { false }
    color { Faker::Color.hex_color.sub(/^#/, '') }
  end
end

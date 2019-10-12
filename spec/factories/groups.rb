# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { Faker::Games::ElderScrolls.dragon.downcase.tr(' ', '_').camelize }
    releaser { false }
    editor { false }
    admin { false }
    color { Faker::Color.hex_color.sub(/^#/, '') }
  end
end

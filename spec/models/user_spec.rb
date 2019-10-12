# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'initializes profile' do
    user = described_class.new
    expect(user.profile).not_to be_blank
    expect(user.profile).to be_a Profile
  end

  context :validations do
    let(:user) { described_class.new }

    it 'requires email' do
      expect(user).not_to be_valid
      expect(user.errors).to have_key :email
      expect(user.errors.details[:email].first[:error]).to eq :blank
    end

    it 'requires valid email' do
      user.email = 'fakeemail'

      expect(user).not_to be_valid
      expect(user.errors).to have_key :email
      expect(user.errors.details[:email].first[:error]).to eq :invalid
    end
  end
end

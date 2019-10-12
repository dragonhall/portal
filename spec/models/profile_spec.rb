# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  context :validations do
    let(:profile) { build :profile, user: build(:user) }

    context :facebook_url do
      it 'allows to be empty' do
        profile.facebook_url = ''

        expect(profile).to be_valid
      end

      it 'disallow invalid url' do
        profile.facebook_url = 'invald'

        expect(profile).not_to be_valid
        expect(profile.errors).to have_key :facebook_url
        expect(profile.errors.details[:facebook_url].first[:error]).to eq :invalid
      end
    end
  end
end

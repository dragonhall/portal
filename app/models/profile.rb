# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :facebook_url, format: { with: URI.regexp(%w[http https]),
                                     allow_blank: true }
  validates :twitter_url, format: { with: URI.regexp(%w[http https]),
                                    allow_blank: true }
  validates :homepage, format: { with: URI.regexp(%w[http https]),
                                 allow_blank: true }

  validates :twitter_id, uniqueness: { allow_blank: true }
  validates :facebook_id, uniqueness: { allow_blank: true }

  def name
    @name || user.email.split('@').first
  end
end

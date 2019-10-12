# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :color, presence: true
  validates :color, format: { with: /\A[0-9a-f]{6}\Z/ }
end

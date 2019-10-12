# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :confirmable

  has_many :memberships
  has_many :groups, through: :memberships

  has_one :profile

  after_initialize :initialize_profile

  private

  def initialize_profile
    self.profile ||= Profile.new(user_id: id)
  end
end

class Group < ApplicationRecord
  has_and_belongs_to_many :users

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :color
  validates :color, format: { with: /\A[0-9a-f]{6}\Z/ }
end

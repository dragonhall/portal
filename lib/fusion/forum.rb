# frozen_string_literal: true

class Fusion::Forum < ApplicationRecord
  extend Fusion::Base

  establish_connection :dragonhall

  pretty_columns :forum_
  self.primary_key = :forum_id

  belongs_to :category, class_name: 'Fusion::Forum', foreign_key: 'forum_cat'
  has_many :posts
  has_many :threads

  scope :toplevels, -> { where(forum_cat: 0) }

  def toplevel?
    forum_cat == 0
  end
end

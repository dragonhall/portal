# frozen_string_literal: true

class Fusion::Group < ApplicationRecord
  extend Fusion::Base

  establish_connection :dragonhall

  self.table_name = 'fusion_user_groups'
  self.primary_key = :group_id

  pretty_columns :group_

  DEFAULT_GROUPS = {
    0 => 'Guest',
    101 => 'Member',
    102 => 'Team member',
    103 => 'Team Leader'
  }.freeze

  def self.merged_groups
    g = []

    all.each do |group|
      g[group.id] = group.name
    end

    DEFAULT_GROUPS.each_pair { |id, v| g[id] = v }

    g
  end
end

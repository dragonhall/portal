# frozen_string_literal: true

class Fusion::Thread < ApplicationRecord
  extend Fusion

  establish_connection :dragonhall

  pretty_columns :thread_
  self.primary_key = :thread_id

  belongs_to :forum, class_name: 'Fusion::Forum'
end

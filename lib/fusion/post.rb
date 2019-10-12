class Fusion::Post < ApplicationRecord
  extend Fusion::Base

  establish_connection :dragonhall

  pretty_columns :post_
  self.primary_key = :post_id

  belongs_to :forum, class_name: 'Fusion::Forum'
  belongs_to :thread, class_name: 'Fusion::Thread'
end

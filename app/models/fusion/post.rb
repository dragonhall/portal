class Fusion::Post < ApplicationRecord
  extend Fusion

  establish_connection :dragonhall

  pretty_columns :post_
  self.primary_key = :post_id

  belongs_to :forum, class_name: 'Fusion::Forum'
  belongs_to :thread, class_name: 'Fusion::Thread'
  belongs_to :author_user, class_name: 'Fusion::User', foreign_key: 'post_author'
  belongs_to :editor, class_name: 'Fusion::User', foreign_key: 'post_edituser'


  def last_edit
    {
      user: self.editor,
      time: self.post_edittime,
      reason: self.reason_edit
    }
  end
end

class Fusion::User < ApplicationRecord
  extend Fusion

  establish_connection :dragonhall

  pretty_columns :user_

  self.primary_key = :user_id

  def avatar_url
    avatar_file = user_avatar.empty? ? DEFAULT_AVATAR : "/images/avatars/#{user_avatar}"
    "#{FUSION_URL}#{avatar_file}"
  end

  def active?
    !user_status
  end

  def groups
    ids = self.attributes['user_groups'].split('.').compact
    ids.delete('')

    ids.map { |g| Fusion::Group.find(g) }
  end

end

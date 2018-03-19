class Fusion::User < ApplicationRecord
  extend Fusion

  establish_connection :dragonhall
  pretty_columns :user_

  def avatar_url
    avatar_file = user_avatar.empty? ? DEFAULT_AVATAR : "/images/avatars/#{user_avatar}"
    "#{FUSION_URL}#{avatar_file}"
  end

  def active?
    !user_status
  end

end

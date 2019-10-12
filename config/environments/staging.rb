require_relative './production.rb'

Rails.application.configure do
  config.consider_all_requests_local       = true

  config.assets.compile = true
end

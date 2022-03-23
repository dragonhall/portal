# frozen_string_literal: true

source 'https://rubygems.org'

ENV['RUBY_DEP_GEM_SILENCE_WARNINGS'] = '1' if `hostname -s`.strip == 'darkstar'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

git_source(:bitbucket) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://bitbucket.org/#{repo_name}.git"
end

def guard(plugins = {})
  gem 'guard'
  plugins.each_pair do |name, version|
    if version == :latest
      gem "guard-#{name}", require: false
    else
      gem "guard-#{name}", version, require: false
    end
  end
end

def omniauth(plugins = {})
  gem 'omniauth'
  plugins.each_pair do |name, version|
    if version == :latest
      gem "omniauth-#{name}"
    else
      gem "omniauth-#{name}", version
    end
  end
end

gem 'mysql2'
gem 'pg'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'

gem 'puma', '5.6.2'

group :assets do
  # gem 'coffee-rails', '~> 4.2'
  gem 'jbuilder', '~> 2.5'
  # gem 'jquery-rails'
  # gem 'jquery-ui-rails'
  # gem 'sass-rails', '~> 5.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'webpacker'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'faker'

  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  # gem 'web-console', '>= 3.3.0'
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'capistrano-foreman'
  gem 'capistrano-linked-files'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'

  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'

  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Guard
  guard rails: :latest,
        spring: :latest,
        rspec: :latest,
        bundler: :latest,
        rake: :latest
  # resque: :latest

  gem 'guard-resque', github: 'jacquescrocker/guard-resque', branch: :master
end

group :test do
  gem 'fuubar'
  gem 'rspec-rails'
  gem 'simplecov'
end

group :application do
  # gem 'active_scheduler'
  gem 'pry-rails'

  gem 'foreman'

  gem 'carrierwave'
  gem 'consul'
  gem 'devise' # , github: 'plataformatec/devise'
  omniauth facebook: :latest,
           twitter: :latest

  gem 'haml-rails'
  gem 'inherited_resources'
  gem 'kaminari'

  gem 'mini_magick'

  gem 'rack-dev-mark'

  gem 'rails-i18n'

  gem 'resque'
  gem 'resque-scheduler'
  gem 'resque-scheduler-web', require: false
  gem 'resque-status'
  gem 'resque-status-web', require: false
  gem 'resque-web', require: false

  gem 'rollbar'
  gem 'simple_form'

  # gem 'streamio-ffmpeg', github: 'streamio/streamio-ffmpeg', branch: :master

  # gem 'blueprint-rails', path: '/home/hron/Projects/contrib/blueprint-rails'

  # gem 'twitter-bootstrap-rails'

  gem 'imgkit'
  gem 'wkhtmltoimage-binary' if RUBY_PLATFORM.match?(/linux|darwin/)

  gem 'geoip'

  gem 'google-analytics-rails'
end

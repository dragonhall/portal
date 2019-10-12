require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups, :application)

module DHPortal
  class Version
    def self.version(root_path)
      @@version ||= if File.exists?("#{root_path}/REVISION") then
                      File.read("#{root_path}/REVISION")
                    else
                      %x(cd #{Rails.root} && git rev-parse HEAD).chomp
                    end[0..6]
    end
  end

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.time_zone = 'Budapest'
    
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('app/inputs')
    config.autoload_paths << Rails.root.join('app/serializers')

    config.log_formatter = ::Logger::Formatter.new

    config.i18n.default_locale = :hu

    if config.respond_to? :rack_dev_mark
      config.rack_dev_mark.enable = !Rails.env.production?
      config.rack_dev_mark.env =
        "#{Rails.env} (#{DHPortal::Version.version(Rails.root)})"
    end

    
    config.active_job.queue_adapter = :resque

    config.generators do |generators|
      unless Rails.env.production? then
        generators.test_framework :rspec,
                                  view_specs: false,
                                  helper_specs: false,
                                  routing_specs: false,
                                  request_specs: false,
                                  fixtures: true
        generators.integration_tool :rspec
        generators.fixture_replacement :factory_girl, dir: 'spec/factories'
      end

      generators.stylesheets :scss
      generators.template_engine :haml
      generators.system_tests = nil
    end
  end
end

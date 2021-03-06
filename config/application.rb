require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.default_locale = :fr

    config.time_zone = 'Africa/Porto-Novo'
    config.active_record.default_timezone = :local

    config.site = {
      name: "Task Manager"
    }

    config.generators do |g|
      g.helper false
      g.assets false
      g.jbuilder false
      g.test_framework :rspec,
        model_specs: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
    end

  end
end

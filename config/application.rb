require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Alarmclock
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Assets Path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join("app", "assets", "images")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("app", "assets", "sounds")

   
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "montserrat")
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "roboto")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "montserrat")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "roboto")

    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf )
    config.assets.precompile += %w( .png, .jpg )
    config.assets.precompile += %w( *.js *.css)

    # Set Time.zone default and make ActiveRecord auto-convert to this time zone
    # (Run 'rake time:zones:all' to display all available time zones)
    config.time_zone = "Mountain Time (US & Canada)"
    # config.active_record.default_timezone = :local
  end
end

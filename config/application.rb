require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module I18nHerokuTest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    #**********************************************************************#
    #
    #      C O N F I G  F R O M  ENV[]
    #
    #**********************************************************************#
    
    # config values go here
    # config.example_config_value               = ENV['EXAMPLE_CONFIG_VALUE']
    # boolean example
    # config.is_on_example                      = ENV.has_key?( "IS_ON_EXAMPLE" ) ? true :false
    # hostname
    config.locale                               = ENV['LOCALE']
  end
  
  # This works, but can we do it without this
  # I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
  # I18n.locale = :en
  if Rails.application.config.respond_to? "locale"
    new_locale = Rails.application.config.locale.to_sym
    I18n.locale = new_locale
    I18n.default_locale = new_locale
    puts "startup I18n is [#{Rails.application.config.i18n.locale}], default_locale is [#{Rails.application.config.i18n.default_locale}]"
    Rails.application.config.i18n.locale = new_locale
    Rails.application.config.i18n.default_locale = new_locale
    puts "startup Rails.application.config.i18n is [#{Rails.application.config.i18n.locale}], default_locale is [#{Rails.application.config.i18n.default_locale}]"
  end
end

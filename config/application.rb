require_relative 'boot'
# require File.expand_path('../app', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CollectionsApp
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/app/adapters" 
    # config.autoload_paths += %W(#{config.root}/app)
#

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

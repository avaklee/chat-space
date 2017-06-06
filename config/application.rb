require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.generators do |g|
      g.assets     false
      g.helper     false
      g.test_flamework     false
      config.i18n.default_locale = :ja
    end
  end
end

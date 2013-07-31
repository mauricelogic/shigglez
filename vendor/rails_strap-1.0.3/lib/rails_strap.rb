require "rails_strap/version"

module RailsStrap
  class Engine < ::Rails::Engine
    # see http://stackoverflow.com/questions/12256291/dependency-included-in-gemspec-not-added-to-asset-pipeline-in-rails-engine
    require "twitter-bootstrap-rails"
    require "flexslider"
    require "prettyphoto-rails"
    require "jquery-rails"
    require "less-rails"

    if Rails.version >= '3.1'
      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w( font-awesome-ie7.min.css rails_strap_modernizer.js )
      end
    end
  end
end
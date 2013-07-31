# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_strap/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_strap"
  spec.version       = RailsStrap::VERSION
  spec.authors       = ["Leon Touroutoglou", "Moritz Winter"]
  spec.email         = ["info@leonart.gr", "info@wintersolutions.de"]
  spec.description   = %q{Clean, multipurpose template.}
  spec.summary       = %q{A clean, multipurpose template for rails, based on the restart template by leonart.}
  spec.homepage      = ""
  spec.license       = "commercial"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "twitter-bootstrap-rails", "2.2.6"

  spec.add_dependency "flexslider", "2.0.2"
  spec.add_dependency "prettyphoto-rails", "0.2.0"
  spec.add_dependency "jquery-rails", "~> 2.0"
  spec.add_dependency "less-rails", "~> 2.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

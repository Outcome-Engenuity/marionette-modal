# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marionette-modal/version'

Gem::Specification.new do |spec|
  spec.name          = "marionette-modal"
  spec.version       = MarionetteModal::VERSION
  spec.authors       = ["Jared Smith"]
  spec.email         = ["jcsmith1859@gmail.com"]
  spec.description   = "Fork of Backbone.Modal Backbone.js plugin"
  spec.summary       = "Fork of the Backbone.Modal Backbone.js plugin that is more tightly integrated with Marionette.js"
  spec.homepage      = "https://github.com/Outcome-Engenuity/marionette-modal"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

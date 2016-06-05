# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/pesticide/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-pesticide"
  spec.version       = Rack::Pesticide::VERSION
  spec.authors       = ["Michael Dippery"]
  spec.email         = ["michael@monkey-robot.com"]
  spec.summary       = %q{Rack middleware to block annoying and pesky HTTP referers}
  spec.homepage      = "https://github.com/mdippery/rack-pesticide"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("rack")
  spec.add_development_dependency("rspec", "~> 3.3")
end

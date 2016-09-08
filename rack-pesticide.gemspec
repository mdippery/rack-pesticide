# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rack/pesticide/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-pesticide"
  spec.version       = Rack::Pesticide::VERSION
  spec.licenses      = ["MIT"]
  spec.authors       = ["Michael Dippery"]
  spec.email         = ["michael@monkey-robot.com"]
  spec.homepage      = "https://github.com/mdippery/rack-pesticide"
  spec.description   = %q{Block crawlers who spam your site with fake HTTP referers}
  spec.summary       = %q{Rack middleware to block annoying and pesky HTTP referers}

  spec.metadata      = {
    'build_date'  => Time.now.strftime("%Y-%m-%d %H:%M:%S %Z"),
    'commit'      => `git describe`.chomp,
    'commit_hash' => `git rev-parse HEAD`.chomp,
  }

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_runtime_dependency('rack', '>= 1.0.1')

  spec.add_development_dependency("rspec", "~> 3.3")
end

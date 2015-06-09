# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openproject/tools/version'

Gem::Specification.new do |spec|
  spec.name          = "openproject-tools"
  spec.version       = Openproject::Tools::VERSION
  spec.authors       = ["Florian Kraft"]
  spec.email         = ["f.kraft@finn.de"]
  spec.summary       = %q{OpenProject Tools provides a set of tools around OpenProject for the CMD Line}
  spec.description   = %q{Openproject Tools provides tools for integrating an developing OpenProject and plugins around it.}
  spec.homepage      = ""
  spec.license       = "GPlv2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop", "~> 0.32"
end

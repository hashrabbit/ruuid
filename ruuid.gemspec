# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruuid/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruuid'
  spec.version       = RUUID::VERSION
  spec.authors       = ['Gabe Evans']
  spec.email         = ['gabe@ga.be']

  spec.summary       = %q{RUUID (Ruby UUID) parses, generates, and represents RFC 4122 universally unique identifiers.}
  spec.homepage      = 'https://github.com/hashrabbit/ruuid'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'pry', '~> 0.10.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
  spec.add_development_dependency 'yard', '~> 0.8.7'
end

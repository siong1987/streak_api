# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'streak_api/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency('bundler', '~> 1.0')
  spec.add_development_dependency('rspec', '~> 2.4')
  spec.add_development_dependency('webmock', '~> 1.6')
  spec.add_development_dependency('bluecloth', '~> 2.0.11')
  spec.add_runtime_dependency('faraday', ['>= 0.7', '< 0.9'])
  spec.add_runtime_dependency('faraday_middleware', '~> 0.8')
  spec.add_runtime_dependency('multi_json', '>= 1.0.3', '~> 1.0')
  spec.add_runtime_dependency('hashie',  '>= 0.4.0')
  spec.authors = ["Teng Siong Ong"]
  spec.description = %q{A Ruby interface to the Streak API.}
  spec.email = ['siong1987@gmail.com']
  spec.files = `git ls-files`.split("\n")
  spec.name = 'streak_api'
  spec.platform = Gem::Platform::RUBY
  spec.require_paths = ['lib']
  spec.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if s.respond_to? :required_rubygems_version=
  spec.rubyforge_project = spec.name
  spec.summary = spec.description
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.version = StreakAPI::VERSION.dup
end

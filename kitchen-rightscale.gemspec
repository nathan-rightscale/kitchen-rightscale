# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitchen/driver/rightscale_version'

Gem::Specification.new do |spec|
  spec.name          = 'kitchen-rightscale'
  spec.version       = Kitchen::Driver::RIGHTSCALE_VERSION
  spec.authors       = ['Nathan Brewer']
  spec.email         = ['nathan.brewer@rightscale.com']
  spec.description   = %q{A Test Kitchen Driver for Rightscale}
  spec.summary       = spec.description
  spec.homepage      = ''
  spec.license       = 'Apache 2.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'test-kitchen', '~> 1.4.0'
  spec.add_dependency 'right_api_client'
  
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'tailor'
  spec.add_development_dependency 'countloc'
end

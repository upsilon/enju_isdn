$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'enju_isdn/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'enju_isdn'
  s.license     = 'Apache-2.0'
  s.version     = EnjuIsdn::VERSION
  s.authors     = ['Kimura Youichi']
  s.email       = ['kim.upsilon@bucyou.net']
  s.homepage    = 'https://github.com/upsilon/enju_isdn'
  s.summary     = 'ISDN (isdn.jp) import for Next-L Enju'
  s.description = 'enju_isdn provides features for importing manifestations from isdn.jp for Next-L Enju'

  s.files = `git ls-files -z`.split("\x00")
  s.test_files = s.files.grep(%r{^spec/})

  s.add_dependency 'enju_subject', '~> 0.2.0'

  s.add_development_dependency 'enju_leaf', '~> 1.2.0'
  s.add_development_dependency 'globalize', '~> 5.0.1'
  s.add_development_dependency 'globalize-accessors'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails', '~> 3.5'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'sunspot_solr', '2.2.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'sunspot-rails-tester'
end

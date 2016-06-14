$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rateitapp/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rateitapp'
  s.version     = Rateitapp::VERSION
  s.authors     = ['Nathan Vanderlaan', 'William Johnston']
  s.email       = ['nvanderlaan@mpr.org', 'wjohnston@mpr.org']
  # s.homepage    = 'TODO'
  s.summary     = 'The app... of power!!!'
  # s.description = 'TODO: Description of Rateitapp.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4.2'

  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'cucumber-rails'
end

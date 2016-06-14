$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rateitapp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rateitapp"
  s.version     = Rateitapp::VERSION
  s.authors     = ["William Johnston"]
  s.email       = ["wjohnston@mpr.org"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Rateitapp."
  s.description = "TODO: Description of Rateitapp."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end

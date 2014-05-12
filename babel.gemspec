$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "babel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "babel"
  s.version     = Babel::VERSION
  s.authors     = ["gcorbel"]
  s.email       = ["guirec.corbel@gmail.com"]
  s.homepage    = "https://github.com/gcorbel/babel"
  s.description = "A Front-end Editor designed to translate a rails application"
  s.summary     = "Front-end editor to translate a rails application"
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.1"
  s.add_dependency "frontendeditor"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "backbone-on-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "minitest"
  s.add_development_dependency "capybara"
end

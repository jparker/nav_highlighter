$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nav_highlighter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nav_highlighter"
  s.version     = NavHighlighter::VERSION
  s.authors     = ["John Parker"]
  s.email       = ["jparker@urgetopunt.com"]
  s.homepage    = "https://github.com/jparker/nav_highlighter"
  s.summary     = "Tools for designating an active tab in a nav element."
  s.description = "Tools for designating an active tab in a nav element."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
end

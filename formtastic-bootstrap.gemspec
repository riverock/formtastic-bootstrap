require File.expand_path('../lib/formtastic-bootstrap/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "formtastic-bootstrap"
  s.version = FormtasticBootstrap::VERSION
  s.authors = ["Matthew Bellantoni", "Aaron Stone"]
  s.email = ["mjbellantoni@yahoo.com", "aaron@serendipity.cx"]
  s.homepage = "http://github.com/mjbellantoni/formtastic-bootstrap"
  s.description = "Formtastic form builder to generate Twitter Bootstrap-friendly markup."
  s.summary = "Formtastic form builder to generate Twitter Bootstrap-friendly markup."
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = Dir[
    ".document",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "lib/**/*.rb",
    "vendor/assets/stylesheets/formtastic-bootstrap.css"
  ]
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"

  s.add_dependency('formtastic', [">= 4.0"])

  s.add_development_dependency('rake')
  s.add_development_dependency('tzinfo')
  s.add_development_dependency('bundler')
  s.add_development_dependency('nokogiri', ["< 1.19"])
  s.add_development_dependency('rspec_tag_matchers', ["~> 1.0"])
  s.add_development_dependency('ammeter', ["~> 0.2"])
  s.add_development_dependency('actionpack', ["~> 5.2"])

  # should be removable after upgrading to Rails 7
  # https://stackoverflow.com/a/79361034
  s.add_development_dependency('concurrent-ruby', ["1.3.4"])
end

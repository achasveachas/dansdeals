# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dansdeals/version'

Gem::Specification.new do |spec|
  spec.name          = "dansdeals"
  spec.version       = DansDeals::VERSION
  spec.authors       = ["Yechiel Kalmenson"]
  spec.email         = ["chilikkal@gmail.com"]

  spec.summary       = %q{Scrapes deals from dansdeals.com.}
  spec.description   = %q{Displays deals from dansdeals.com, 5 at a time,  and gives info about each one..}
  spec.homepage      = "https://github.com/achasveachas/dansdeals"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["dansdeals"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end

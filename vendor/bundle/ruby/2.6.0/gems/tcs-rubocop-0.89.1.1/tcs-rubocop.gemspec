# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tcs/rubocop/version"

Gem::Specification.new do |spec|
  spec.name          = "tcs-rubocop"
  spec.version       = Tcs::Rubocop::VERSION
  spec.authors       = ["Barrett Clark", "Pete Sharum"]
  spec.email         = ["BAClark@containerstore.com", "RPSharum@containerstore.com"]

  spec.summary       = "The Container Store's Ruby Styleguide and Rubocop Config."
  spec.homepage      = "https://github.com/the-container-store/tcs-rubocop"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://nexus.containerstore.com/nexus/repository/rubygems-private"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6"

  spec.add_dependency "rubocop", "0.89.1"
  spec.add_dependency "rubocop-performance", "1.8.1"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake"
end

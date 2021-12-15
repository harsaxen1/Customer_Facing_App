# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tcs/config/version"

Gem::Specification.new do |spec|
  spec.name          = "tcs-config"
  spec.version       = Tcs::Config::VERSION
  spec.authors       = ["Ed Wagner"]
  spec.email         = ["ewwagner@containerstore.com"]

  spec.summary       = "Locate settings provided by the deployment environment and expose them to the application"
  spec.homepage      = "https://github.com/the-container-store/Tcs-Config-Gem"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://nexus.containerstore.com/nexus/repository/rubygems-private"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.required_ruby_version = ">= 2.5.3"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk-core"
  spec.add_dependency "diplomat", "~> 2.0"
  spec.add_dependency "vault", "~> 0.12"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  if RUBY_VERSION >= "2.6"
    spec.add_development_dependency "tcs-rubocop"
  elsif RUBY_VERSION >= "2.4"
    spec.add_development_dependency "tcs-rubocop", "0.5.0"
  end
end

# -*- encoding: utf-8 -*-
# stub: tcs-config 1.13.5 ruby lib

Gem::Specification.new do |s|
  s.name = "tcs-config".freeze
  s.version = "1.13.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "http://nexus.containerstore.com/nexus/repository/rubygems-private" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ed Wagner".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-05-28"
  s.email = ["ewwagner@containerstore.com".freeze]
  s.homepage = "https://github.com/the-container-store/Tcs-Config-Gem".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.3".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Locate settings provided by the deployment environment and expose them to the application".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws-sdk-core>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<diplomat>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<vault>.freeze, ["~> 0.12"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<tcs-rubocop>.freeze, [">= 0"])
    else
      s.add_dependency(%q<aws-sdk-core>.freeze, [">= 0"])
      s.add_dependency(%q<diplomat>.freeze, ["~> 2.0"])
      s.add_dependency(%q<vault>.freeze, ["~> 0.12"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<tcs-rubocop>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<aws-sdk-core>.freeze, [">= 0"])
    s.add_dependency(%q<diplomat>.freeze, ["~> 2.0"])
    s.add_dependency(%q<vault>.freeze, ["~> 0.12"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<tcs-rubocop>.freeze, [">= 0"])
  end
end

# -*- encoding: utf-8 -*-
# stub: tcs-rubocop 0.89.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "tcs-rubocop".freeze
  s.version = "0.89.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "http://nexus.containerstore.com/nexus/repository/rubygems-private" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Barrett Clark".freeze, "Pete Sharum".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-10-22"
  s.email = ["BAClark@containerstore.com".freeze, "RPSharum@containerstore.com".freeze]
  s.homepage = "https://github.com/the-container-store/tcs-rubocop".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "The Container Store's Ruby Styleguide and Rubocop Config.".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubocop>.freeze, ["= 0.89.1"])
      s.add_runtime_dependency(%q<rubocop-performance>.freeze, ["= 1.8.1"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rubocop>.freeze, ["= 0.89.1"])
      s.add_dependency(%q<rubocop-performance>.freeze, ["= 1.8.1"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rubocop>.freeze, ["= 0.89.1"])
    s.add_dependency(%q<rubocop-performance>.freeze, ["= 1.8.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end

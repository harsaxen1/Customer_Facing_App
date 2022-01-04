# -*- encoding: utf-8 -*-
# stub: diplomat 2.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "diplomat".freeze
  s.version = "2.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Hamelink".freeze, "Trevor Wood".freeze, "Pierre Souchay".freeze]
  s.date = "2021-02-10"
  s.description = "Diplomat is a simple wrapper for Consul".freeze
  s.email = ["john@johnhamelink.com".freeze, "trevor.g.wood@gmail.com".freeze, "p.souchay@criteo.com".freeze]
  s.homepage = "https://github.com/WeAreFarmGeek/diplomat".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Diplomat is a simple wrapper for Consul".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.2"])
      s.add_development_dependency(%q<cucumber>.freeze, ["~> 5.3"])
      s.add_development_dependency(%q<fakes-rspec>.freeze, ["~> 2.1"])
      s.add_development_dependency(%q<fivemat>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<gem-release>.freeze, ["~> 2.2"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.10"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.93.1"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21.2"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<deep_merge>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0.9"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 2.2"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 5.3"])
      s.add_dependency(%q<fakes-rspec>.freeze, ["~> 2.1"])
      s.add_dependency(%q<fivemat>.freeze, ["~> 1.3"])
      s.add_dependency(%q<gem-release>.freeze, ["~> 2.2"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.10"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.93.1"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.21.2"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<deep_merge>.freeze, ["~> 1.2"])
      s.add_dependency(%q<faraday>.freeze, [">= 0.9"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.2"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 5.3"])
    s.add_dependency(%q<fakes-rspec>.freeze, ["~> 2.1"])
    s.add_dependency(%q<fivemat>.freeze, ["~> 1.3"])
    s.add_dependency(%q<gem-release>.freeze, ["~> 2.2"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.10"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.93.1"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.21.2"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<deep_merge>.freeze, ["~> 1.2"])
    s.add_dependency(%q<faraday>.freeze, [">= 0.9"])
  end
end

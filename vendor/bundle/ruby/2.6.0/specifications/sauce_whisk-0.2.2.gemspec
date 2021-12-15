# -*- encoding: utf-8 -*-
# stub: sauce_whisk 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "sauce_whisk".freeze
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dylan Lacey".freeze]
  s.date = "2019-08-09"
  s.description = "A Wrapper for the Sauce Labs REST API.".freeze
  s.email = ["github@dylanlacey.com".freeze]
  s.homepage = "http://www.github.com/saucelabs/sauce_whisk".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Sauce_Whisk lets you mix extra data into your Sauce test results! Fetch and update Job details, screenshots, videos and logs.".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0.3"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.4"])
    else
      s.add_dependency(%q<rest-client>.freeze, ["~> 2.0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<vcr>.freeze, ["~> 3.0.3"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.3"])
      s.add_dependency(%q<rake>.freeze, [">= 10.4"])
    end
  else
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0.3"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.3"])
    s.add_dependency(%q<rake>.freeze, [">= 10.4"])
  end
end

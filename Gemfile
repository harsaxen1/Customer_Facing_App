# frozen_string_literal: true

source "http://nexus.containerstore.com/nexus/repository/rubygems-group"

# Test-related dependencies
gem "capybara", "~> 3.1"
gem "cucumber", "~> 3.1"
gem "parallel_tests"
gem "rspec", "~> 3.8"
gem "sauce_whisk", "~> 0.2"
gem "selenium-webdriver", "~> 3.142"

# Emulated mobile device testing
source "https://rubygems.org" do
  gem "appium_lib", "~> 11.2"
  gem "appium_lib_core", "~> 4.2"
end

# General support dependencies
gem "activesupport", "~> 5.2"
gem "dotenv"
gem "htmlentities"
gem "nokogiri"
#gem "openssl"
gem "parser", "~> 2.6"
gem "rake"
gem "require_all", "~> 1.5"
gem "vault"

# TCS dependencies
gem "brakeman", require: false
#gem "bundler-audit", require: false
gem "flog", require: false
gem "reek", require: false
gem "tcs-config"
gem "tcs-rubocop", require: false

# For generating .ical of freeze periods (see test @n_007)
gem "icalendar"

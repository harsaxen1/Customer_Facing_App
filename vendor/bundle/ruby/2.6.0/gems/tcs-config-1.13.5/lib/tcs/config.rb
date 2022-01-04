# frozen_string_literal: true

require "erb"
require "diplomat"
require "vault"
require "yaml"
require "tcs/config/consul_service"
require "tcs/config/root_node"
require "tcs/config/vault_service"
require "tcs/config/version"

module Tcs
  module Config
    SECRET_DIRECTORY = ENV.fetch("SECRETS_ROOT", "/etc/secrets")
    extend SingleForwardable

    # Returns an object that has all of the deploy-specific values
    def self.load_deploy_settings(config_file_path = "config/tcs-config.yml")
      Tcs::Config::ConsulService.configure_consul
      Tcs::Config::VaultService.configure_vault
      @root_node = Tcs::Config::RootNode.new(load_config_file(config_file_path))
      def_delegators :@root_node, :to_hash, :to_env_hash, *@root_node.public_methods(false)
    end

    def self.load_config_file(path)
      yaml = Pathname.new(path)

      raise "Could not load configuration. No such file - #{yaml}" unless yaml.exist?

      YAML.load(ERB.new(yaml.read).result) || {}
    rescue Psych::SyntaxError => e
      raise "YAML syntax error occurred while parsing #{yaml}. " \
          "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
          "Error: #{e.message}"
    end
    private_class_method :load_config_file
  end
end

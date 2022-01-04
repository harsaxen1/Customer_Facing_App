# frozen_string_literal: true

require "tcs/config/node"

module Tcs
  module Config
    class RootNode < Node
      def initialize(config_hash)
        super(nil, nil, config_hash)
      end

      def key_path
        module_name
      end

      # Returns a hash of values keyed by `env` key. The values will be transformed into strings appropriate for
      # assigning to environment variables.
      #
      # The most common use case is for transferring configuration to another process via environment. For example,
      # applications that use cron for job scheduling (as with the whenever gem) need to make configuration available
      # to scheduled processes. Environment variables are a convenient mechanism that aren't affected by Vault token
      # expiration.
      #
      # With these lines in `config/tcs-config.yml`, the database username might be retrieved from Vault by the parent
      # process:
      #
      # ```
      # database:
      #   username:
      #     env: DB_USERNAME
      #     vault: secret/database/<%= env %>/mms/online_merch_app/username
      # ```
      #
      # For the whenever gem, add this line to `config/schedule.rb` to pass the value to the cron-triggered process
      # via the `DB_USERNAME` environment variable:
      #
      # ```
      # Tcs::Config.to_env_hash.each { |key, value| env(key, value) }
      #```
      def to_env_hash
        leaf_nodes.each_with_object({}) do |node, h|
          h[node.env_key] = node.value.to_s.delete(%q('")) if node.env_key
        end
      end

      private

      def module_name
        self.class.to_s[/(.*)::/, 1]
      end
    end
  end
end

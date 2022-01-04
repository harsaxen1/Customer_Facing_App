# frozen_string_literal: true

require_relative "logging"

module Tcs
  module Config
    class StringInquirer < String
      private

      def method_missing(method_name, *arguments)
        if method_name[-1] == "?"
          self == method_name[0..-2]
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        method_name.to_s.end_with?("?") || super
      end
    end

    class Value
      include Logging

      VAULT_FORBIDDEN_CODE = 403
      ENVIRONMENTS = %w{local sbx dev tst stg prd trn svc}.freeze
      SECRET_REGEXP = %r(\A/?(?:secret/)?(?<path>.+)/(?<key>.+)\Z).freeze
      PATH_REGEXP = %r(\A/?
                         (?:secret/)?
                         (?<category>.+?)/
                         (?<environment>#{ENVIRONMENTS.join("|")})(?<stack>.*?)/
                         (?<subpath>.+)/
                         (?<key>.+)\Z)x.freeze

      attr_reader :value

      def initialize(node, locations)
        @node = node
        @default = locations["default"]
        @type = locations["type"]&.downcase
        @value = lookup_value(locations)
      end

      private

      def lookup_value(locations) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        string_value = lookup_env(locations["env"]) ||
                       lookup_from_consul(locations["consul"]) ||
                       lookup_secret(locations["secret"]) ||
                       lookup_from_vault(locations["vault"]) ||
                       @default

        return nil if string_value.nil?

        if array_element_type(@type) || @default.is_a?(Array)
          coerce_array(string_value)
        else
          coerce_value(string_value)
        end
      end

      # Fetch the value of the specified environment variable
      def lookup_env(variable_name)
        return nil if variable_name.nil?

        ENV.fetch(variable_name, nil)
      end

      # Read a secret from the specified file
      def lookup_secret(secret_path)
        return nil if secret_path.nil?

        file = Pathname.new(Tcs::Config::SECRET_DIRECTORY + secret_path)
        return nil unless file.exist?

        file.read.chomp
      end

      # Fetch a value from the specified Consul path
      def lookup_from_consul(consul_path)
        return nil if consul_path.nil?

        case consul_path
        when Array
          consul_path.reduce(nil) { |result, path| read_from_consul_path(path) || result }
        else
          read_from_consul_path(consul_path) ||
            read_from_consul_path(path_without_stack(consul_path)) ||
            read_from_consul_path(substitute_default_environment(consul_path))
        end
      end

      # Fetch a secret from the specified Vault path(s)
      def lookup_from_vault(vault_path) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        return nil if vault_path.nil?
        return nil if Vault.token.nil? || Vault.token.empty?

        case vault_path
        when Array
          vault_path.reduce(nil) { |result, path| read_from_vault_path(path) || result }
        else
          read_from_vault_path(vault_path) ||
            read_from_vault_path(path_without_stack(vault_path)) ||
            read_from_vault_path(substitute_default_environment(vault_path))
        end
      end

      # If we see an environment and stack in the path, then look at just the environment
      def path_without_stack(secret_path)
        m = PATH_REGEXP.match(secret_path)
        return nil if m.nil?

        category, environment, stack, subpath, key = m.captures
        return nil if stack.nil? || stack.empty?

        [category, environment, subpath, key].join("/")
      end

      # If we see an environment and/or stack in the path, then substitute `default` for the environment
      def substitute_default_environment(secret_path)
        m = PATH_REGEXP.match(secret_path)
        return nil if m.nil?

        category, _, _, subpath, key = m.captures
        [category, "default", subpath, key].join("/")
      end

      # Connect to Consul and try to read the value
      def read_from_consul_path(path)
        return nil if path.nil? || path.empty?

        logger.debug "Attempting to read #{path} from Consul."
        Diplomat::Kv.get(path)
      rescue Diplomat::KeyNotFound, Diplomat::UnknownStatus
        logger.debug("Couldn't find #{path} in Consul")
        nil
      end

      # Connect to Vault and try to read the secret
      def read_from_vault_path(secret_path)
        return nil if secret_path.nil?

        m = SECRET_REGEXP.match(secret_path)
        return nil if m.nil?

        path = "secret/#{m[:path]}"
        key = m[:key].to_sym

        logger.debug "Attempting to read #{path}/#{key} from Vault."
        Vault.with_retries(Vault::HTTPConnectionError) do
          Vault.logical.read(path)&.data&.[](key)
        end
      rescue Vault::HTTPClientError => e
        if e.code == VAULT_FORBIDDEN_CODE
          logger.warn "Access denied when trying to read #{secret_path} from Vault."
          return nil
        end
        raise
      end

      def coerce_value(value, type = @type)
        type ||= "integer" if @default.is_a? Integer # Infer integer type where appropriate
        case type
        when nil, "string"
          coerce_string(value)
        when "boolean"
          coerce_boolean(value)
        when "integer"
          coerce_integer(value)
        else
          logger.warn <<~WARN
            #{@node.key_path} was assigned a type (#{type}) which is not supported.
            Valid types are 'string', 'boolean' and 'integer'. Value will be assigned as a String.
          WARN
          coerce_string(value)
        end
      end

      def coerce_array(value)
        array = case value
                when Array
                  value
                when String
                  string_to_array(value)
                end
        if array.nil?
          raise ArgumentError, "#{@node.key_path} was assigned a value (#{value.inspect}) which is not an array."
        end

        array.map { |v| coerce_value(v, array_element_type(@type)) }
      end

      def string_to_array(string)
        return nil unless string.is_a? String

        string_without_brackets = string.match(/\[(.*)\]/)&.[](1)
        string_without_brackets&.split(/\s*,\s*/)
      end

      def array_element_type(type)
        type&.match(/^array of (.*)s/)&.[](1)
      end

      def coerce_boolean(value)
        return value if [true, false].include?(value)

        if value == "true"
          true
        elsif value == "false"
          false
        else
          raise ArgumentError, "#{@node.key_path} was assigned a value (#{value.inspect}) that is not a boolean."
        end
      end

      def coerce_integer(value)
        return value if value.is_a?(Integer)

        begin
          Integer(value, 10)
        rescue ArgumentError
          raise ArgumentError, "#{@node.key_path} was assigned a value (#{value.inspect}) that is not an integer."
        end
      end

      def coerce_string(value)
        StringInquirer.new(value.to_s)
      end

      def split_vault_path_key(vault_secret_path)
        [vault_secret_path.split("/")[0..-2].join("/"), vault_secret_path.split("/")[-1]]
      end

    end
  end
end

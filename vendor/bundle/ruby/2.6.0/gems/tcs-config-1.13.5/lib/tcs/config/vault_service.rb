# frozen_string_literal: true

require "aws-sdk-core"
require_relative "logging"

module Tcs
  module Config
    module VaultService
      include Logging

      DEFAULT_VAULT_ADDR = "https://vault.containerstore.com"
      VAULT_TOKEN_FILE_PATH = "/vault-token/.vault-token" # Where a token file can be mounted
      RENEWAL_FAILURE_RETRY_DELAY = 10 * 60 # Retry every 10 minutes
      NOT_RENEWABLE_ERROR_MESSAGE = "lease is not renewable"

      def self.configure_vault
        Vault.address = vault_address
        if find_vault_token
          start_vault_token_renewal
        elsif ENV["VAULT_ROLE"] && !ENV["VAULT_ROLE"].empty?
          authenticate_using_iam
        end
      end

      def self.vault_address
        return ENV["VAULT_ADDR"] if ENV["VAULT_ADDR"] && !ENV["VAULT_ADDR"].empty?

        DEFAULT_VAULT_ADDR
      end

      def self.find_vault_token
        if ENV["VAULT_TOKEN"] && !ENV["VAULT_TOKEN"].empty?
          Vault.token = ENV["VAULT_TOKEN"]
        elsif File.exist?(VAULT_TOKEN_FILE_PATH)
          Vault.token = File.read(VAULT_TOKEN_FILE_PATH)
        end
      end

      def self.in_ecs?
        ecs_detection = ENV["AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"]
        ecs_detection && !ecs_detection.empty?
      end

      def self.in_aws_with_access_keys?
        ENV["AWS_ACCESS_KEY_ID"] && !ENV["AWS_ACCESS_KEY_ID"].empty? &&
          ENV["AWS_SECRET_ACCESS_KEY"] && !ENV["AWS_SECRET_ACCESS_KEY"].empty? &&
          ENV["AWS_SESSION_TOKEN"] && !ENV["AWS_SESSION_TOKEN"].empty?
      end

      def self.do_auth_with_iam(credentials_provider)
        Vault.auth.aws_iam(vault_role,
                           credentials_provider,
                           iam_auth_server_header_value)
      end

      def self.authenticate_using_iam
        if in_ecs?
          do_auth_with_iam(Aws::ECSCredentials.new)
        elsif in_aws_with_access_keys?
          do_auth_with_iam(Aws::Credentials.new(
            ENV["AWS_ACCESS_KEY_ID"],
            ENV["AWS_SECRET_ACCESS_KEY"],
            ENV["AWS_SESSION_TOKEN"]))
        else
          logger.error("Could not come up with a valid AWS credential set")
        end
        logger.info("Authenticated with Vault using AWS IAM and #{vault_role}")
      end

      def self.vault_role
        if ENV["DEPLOYMENT_ENVIRONMENT"] && !ENV["DEPLOYMENT_ENVIRONMENT"].empty?
          "#{ENV["VAULT_ROLE"]}-#{ENV["DEPLOYMENT_ENVIRONMENT"]}"
        else
          ENV["VAULT_ROLE"]
        end
      end

      # To mitigate against replay attacks from a dev Vault server,
      # pass the Vault host name as a X-Vault-AWS-IAM-Server-ID header
      def self.iam_auth_server_header_value
        URI.parse(Vault.address).host
      end

      def self.start_vault_token_renewal
        Thread.new do
          loop do
            begin
              seconds_until_next_renewal = renew_token
            rescue StandardError => e
              if e.is_a?(Vault::HTTPClientError) && e.code == 400 && e.errors.include?(NOT_RENEWABLE_ERROR_MESSAGE)
                # If the token isn't renewable, then exit this thread
                logger.info("Vault token is not renewable.")
                break
              end
              logger.warn("Failed to renew the Vault token\n#{e.message}")
              seconds_until_next_renewal = RENEWAL_FAILURE_RETRY_DELAY
            end
            sleep(seconds_until_next_renewal)
          end
        end
      end

      def self.renew_token
        s = Vault.auth_token.renew_self
        logger.info("Renewed the Vault token for another #{s.auth.lease_duration}s.")
        s.auth.lease_duration / 2 # Sleep halfway to expiration
      end
    end
  end
end

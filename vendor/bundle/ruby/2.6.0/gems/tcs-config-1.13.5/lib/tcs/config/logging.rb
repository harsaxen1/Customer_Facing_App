# frozen_string_literal: true

require "logger"

module Tcs
  module Config
    module Logging
      class << self
        def logger
          return Rails.logger if defined?(Rails) && Rails.logger

          @logger ||= Logger.new(STDOUT).tap do |logger|
            logger.progname = "Tcs::Config"
            logger.formatter = proc do |severity, datetime, progname, msg|
              "#{datetime.strftime('%Y-%m-%dT%H:%M:%S.%L%z')} #{severity} #{progname}: #{msg}\n"
            end
          end
        end

        attr_writer :logger
      end

      # Create a logger class method
      def self.included(base)
        class << base
          def logger
            Logging.logger
          end
        end
      end

      def logger
        Logging.logger
      end
    end
  end
end

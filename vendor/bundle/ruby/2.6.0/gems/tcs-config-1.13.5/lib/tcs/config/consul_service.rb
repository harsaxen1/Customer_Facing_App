# frozen_string_literal: true

module Tcs
  module Config
    module ConsulService
      DEFAULT_CONSUL_ADDR = "http://dfwconsv1.containerstore.com:8500"

      def self.configure_consul
        Diplomat.configure do |config|
          config.url = ENV.fetch("CONSUL_ADDR", DEFAULT_CONSUL_ADDR)
        end
      end
    end
  end
end

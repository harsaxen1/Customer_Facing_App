# frozen_string_literal: true

require "tcs/config/value"

module Tcs
  module Config
    class Node
      attr_reader :parent, :key

      def initialize(parent, key, config_hash)
        @parent = parent
        @key = key
        @config_hash = config_hash
        @value = build_value
        create_reader_methods
      end

      def [](key)
        raise ArgumentError, "#{key_path} doesn't have any children so can't be called with []" if leaf?

        @value[indifferent_access(key)]&.value
      end

      def value
        @value.is_a?(Value) ? @value.value : self
      end

      def leaf?
        @value.is_a?(Value)
      end

      # Create a deep copy that are plain Ruby Hashes
      def to_hash
        return value unless @value.is_a? Hash

        ret_hash = {}
        @value.each do |key, node|
          ret_hash[key] = node.to_hash
        end
        ret_hash
      end

      def key_path
        "#{parent.key_path}.#{key}"
      end

      def leaf_nodes
        return [self] if leaf?

        @value.values.each_with_object([]) { |v, a| a.push(*v.leaf_nodes) }
      end

      def env_key
        return nil unless leaf?

        @config_hash["env"]
      end

      private

      def build_value
        return Value.new(self, @config_hash) if this_node_will_be_a_leaf?

        ret = {}
        @config_hash.each do |key, value|
          raise ArgumentError, "Expected #{key} to point to a Hash, not #{value.inspect}" unless value.is_a?(Hash)

          ret[key] = Node.new(self, key, value)
        end
        ret
      end

      # Support referencing values by symbolic keys as well as string keys (normalize to string keys)
      def indifferent_access(key)
        key.to_s
      end

      # Are there any hashes nested in the @config_hash? If so, this Node will not be a leaf.
      def this_node_will_be_a_leaf?
        @config_hash.none? { |_key, value| value.is_a?(Hash) }
      end

      def create_reader_methods
        return unless @value.is_a? Hash

        @value.each do |property, child_node|
          define_singleton_method(property.to_sym) { child_node.value }
          define_singleton_method(:"#{property}?") { !!child_node.value }
        end
      end
    end
  end
end

require 'singleton'

module RUUID
  # Generator is responsible for generating new UUIDs. Implementors can
  # include and override methods to provide new UUID variants.
  module Generator
    def self.included(base)
      super
      base.extend ClassMethods
      base.include Singleton
    end

    module ClassMethods
      def version(value)
        instance.version = value
      end

      def source(value)
        instance.source = value
      end

      def generate
        instance.generate
      end
    end # ClassMethods

    attr_accessor :version, :source

    def initialize
      @version = 0
    end

    def generate
      UUID.from_data(masked_bytes)
    end

    private

    def raw_bytes
      unless source.respond_to?(:call)
        raise NotImplementedError, "#{self.class} does not specify a data source"
      end
      source.call.bytes
    end

    def masked_bytes
      raw_bytes.tap { |bytes|
        # Mask version
        bytes[6] = (bytes[6] & 0x0f) | (version << 4)
        # Mask variant
        bytes[8] = (bytes[8] & 0x3f) | 0x80
      }.collect(&:chr).join
    end
  end # Generator
end # RUUID

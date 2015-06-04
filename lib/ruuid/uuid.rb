module RUUID
  class UUID
    include Comparable

    def self.parse(string)
      new(Parser.parse(string))
    end

    def initialize(data = RUUID.default_generator.generate)
      @data = normalize(data)
      validate
    end

    attr_reader :data

    def to_s(format = RUUID.default_format)
      Formatter.format(data, format)
    end
    alias_method :to_str, :to_s

    def to_json(*args)
      to_s(*args).to_json
    end

    def inspect
      "<#{self.class}:0x#{object_id} data=#{to_s}>"
    end

    # @private
    def marshal_dump
      data
    end

    # @private
    def marshal_load(data)
      @data = data.dup.freeze
      validate
    end

    def hash
      data.hash
    end

    def ==(other)
      return super unless other.respond_to?(:data)
      data == other.data
    end
    alias_method :eql?, :==

    def ===(other)
      return super unless other.respond_to?(:to_str)
      to_str === other.to_str
    end

    def <=>(other)
      return super unless other.respond_to?(:data)
      data <=> other.data
    end

    def version
      data.bytes[6] >> 4
    end

    private

    def validate
      unless data.length == 16
        raise InvalidUUIDError, "Invalid UUID length: #{data.inspect}"
      end

      unless data.bytes[8] >> 6 == 2
        raise InvalidUUIDError, "Invalid UUID variant: #{data.inspect}"
      end
    end

    def normalize(data)
      data.dup.force_encoding(Encoding::BINARY).freeze
    end
  end # UUID
end # RUUID

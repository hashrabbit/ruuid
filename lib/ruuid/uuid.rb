module RUUID
  class UUID
    # @private
    def self.from_data(data)
      uuid = allocate
      uuid.instance_variable_set :@data, data.dup.freeze
      uuid
    end

    def self.parse(string)
      from_data(Parser.parse(string))
    end

    # @private
    def initialize
      raise RuntimeError, 'RUUID::UUID.new is not allowed. Use RUUID.generate instead.'
    end

    # @private
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

    def marshal_dump
      data
    end

    def marshal_load(data)
      @data = data.dup.freeze
    end

    def version
      data.bytes[6] >> 4
    end
  end # UUID
end # RUUID

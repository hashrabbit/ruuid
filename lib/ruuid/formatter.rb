module RUUID
  # @private
  module Formatter
    extend self

    HEX_FORMAT = 'H8 H4 H4 H4 H12'.freeze

    def format(data, format = RUUID.default_format)
      parts = data.unpack(HEX_FORMAT)

      case format
      when :canonical then parts.join('-')
      when :compact   then parts.join
      else
        raise ArgumentError, "`#{format.inspect}' format not supported. Supported formats are: :canonical and :compact"
      end
    end
  end
end

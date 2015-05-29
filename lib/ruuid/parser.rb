module RUUID
  # @private
  module Parser
    extend self

    BLACKLIST = /[^a-f0-9]/i

    def parse(string)
      string = sanitize(string)
      [string].pack('H*')
    end

    private

    def sanitize(string)
      string.gsub(BLACKLIST, '')
    end
  end # Parser
end # RUUID

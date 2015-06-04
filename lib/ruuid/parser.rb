module RUUID
  # @private
  module Parser
    extend self

    FORMAT = /^\h{8}-?\h{4}-?\h{4}-?[89ab]\h{3}-?\h{12}$/i

    def parse(string)
      if string[FORMAT]
        [string.gsub(/\H/, '')].pack('H*')
      else
        string
      end
    end
  end # Parser
end # RUUID

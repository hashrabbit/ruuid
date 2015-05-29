require 'spec_helper'

describe RUUID::Parser do
  describe '.parse' do
    it 'parses canonical formatted strings' do
      expect(RUUID::Parser.parse('123e4567-e89b-12d3-a456-426655440000')).to eq(
        "\x12>Eg\xE8\x9B\x12\xD3\xA4VBfUD\x00\x00".force_encoding('BINARY')
      )
    end

    it 'parses compact formatted strings' do
      expect(RUUID::Parser.parse('de305d5475b4431badb2eb6b9e546014')).to eq(
        "\xDE0]Tu\xB4C\e\xAD\xB2\xEBk\x9ET`\x14".force_encoding('BINARY')
      )
    end
  end
end

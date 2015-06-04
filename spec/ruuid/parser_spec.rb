require 'spec_helper'

describe RUUID::Parser do
  describe '.parse' do
    subject(:parsed) do
      RUUID::Parser.parse(uuid)
    end

    context 'when supplied canonical formatted string' do
      let(:uuid) do
        '123e4567-e89b-42d3-a456-a26655440000'
      end

      it 'returns decoded bytes' do
        expect(parsed).to eq(
          "\x12>Eg\xE8\x9BB\xD3\xA4V\xA2fUD\x00\x00".force_encoding('BINARY')
        )
      end
    end

    context 'when supplied compact formatted string' do
      let(:uuid) do
        'de305d5475b4431badb2eb6b9e546014'
      end

      it 'returns decoded bytes' do
      expect(parsed).to eq(
        "\xDE0]Tu\xB4C\e\xAD\xB2\xEBk\x9ET`\x14".force_encoding('BINARY')
      )
      end
    end

    context 'when supplied malformed string' do
      let(:uuid) do
        '!123e4567-e89b-42d3-a456-a26655440000'
      end

      it 'passes through supplied string' do
        expect(parsed).to eq(uuid)
      end
    end

    context 'when supplied raw bytes' do
      let(:uuid) do
        "\a\b\c\d\e\f"
      end

      it 'passes through supplied bytes' do
        expect(parsed).to eq(uuid)
      end
    end
  end
end

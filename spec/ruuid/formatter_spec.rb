require 'spec_helper'

describe RUUID::Formatter do
  describe '.format' do
    let(:data) do
      'forcryingoutloud'
    end

    let(:formatted) do
      RUUID::Formatter.format(data, format)
    end

    context 'when format :canonical' do
      let(:format) do
        :canonical
      end

      it 'returns hyphen-delimited, hex-encoded string' do
        expect(formatted).to eq('666f7263-7279-696e-676f-75746c6f7564')
      end
    end

    context 'when format :compact' do
      let(:format) do
        :compact
      end

      it 'returns hex-encoded string' do
        expect(formatted).to eq('666f72637279696e676f75746c6f7564')
      end
    end

    context 'when format not supported' do
      it 'raises ArgumentError' do
        expect {
          RUUID::Formatter.format(data, :fancy)
        }.to raise_error(ArgumentError)
      end
    end
  end
end

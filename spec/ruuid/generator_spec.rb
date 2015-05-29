require 'spec_helper'

describe RUUID::Generator do
  let(:generator_class) do
    Class.new do
      include RUUID::Generator

      version 0
      source ->{ "\xff" * 16 }
    end
  end

  let(:generator) do
    generator_class.instance
  end

  subject { generator_class }

  describe '.new' do
    it 'raises error' do
      expect { generator_class.new }.to raise_error
    end
  end

  describe '.version' do
    let(:dub) do
      double
    end

    it 'sets supplied version on .instance' do
      generator_class.version(dub)
      expect(generator.version).to eq(dub)
    end
  end

  describe '.source' do
    let(:dub) do
      double
    end

    it 'sets supplied source on .instance' do
      generator_class.source(dub)
      expect(generator.source).to eq(dub)
    end
  end

  describe '.generate' do
    it 'delegates to .instance' do
      expect(generator).to receive(:generate)
      generator_class.generate
    end
  end

  describe '#generate' do
    context 'when source not callable' do
      before do
        generator.source = nil
      end

      it 'raises NotImplementedError' do
        expect { generator.generate }.to raise_error(NotImplementedError)
      end
    end

    context 'when source callable' do
      subject(:uuid) do
        generator.generate
      end

      it 'returns new RUUID::UUID' do
        expect(uuid).to be_a(RUUID::UUID)
        expect(uuid.version).to eq(uuid.version)
        expect(uuid.to_s).to eq('ffffffff-ffff-0fff-bfff-ffffffffffff')
      end
    end
  end
end

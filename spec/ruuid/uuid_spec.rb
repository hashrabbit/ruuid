require 'spec_helper'

describe RUUID::UUID do
  subject(:uuid) do
    RUUID.generate
  end

  let(:other) do
    double(RUUID::UUID, data: data)
  end

  let(:data) do
    double(String)
  end


  describe '.new' do
    it 'raises RuntimeError' do
      expect { RUUID::UUID.new }.to raise_error(RuntimeError)
    end
  end

  # HAX(gevans): My BDD-fu is rusty. Fixtures for everyone!
  describe '#version' do
    let(:uuid_strings) do
      {
        'ffffffff-ffff-0fff-ffff-ffffffffffff' => 0,
        'ffffffff-ffff-1fff-ffff-ffffffffffff' => 1,
        'ffffffff-ffff-2fff-ffff-ffffffffffff' => 2,
        'ffffffff-ffff-3fff-ffff-ffffffffffff' => 3,
        'ffffffff-ffff-4fff-ffff-ffffffffffff' => 4,
        'ffffffff-ffff-5fff-ffff-ffffffffffff' => 5,
        'ffffffff-ffff-6fff-ffff-ffffffffffff' => 6,
        'ffffffff-ffff-7fff-ffff-ffffffffffff' => 7,
        'ffffffff-ffff-8fff-ffff-ffffffffffff' => 8,
        'ffffffff-ffff-9fff-ffff-ffffffffffff' => 9,
      }
    end

    let(:uuids) do
      Hash[uuid_strings.collect { |string, version|
        [RUUID::UUID.parse(string), version]
      }]
    end

    it 'reads version from raw bytes' do
      uuids.each do |uuid, version|
        expect(uuid.version).to eq(version)
      end
    end
  end

  describe '#hash' do
    it 'returns data hash' do
      expect(uuid).to receive(:data).and_return(data)
      expect(uuid.hash).to eq(data.hash)
    end
  end

  %i[== eql?].each do |method_name|
    describe "##{method_name}" do
      context 'when other respond to #data' do
        context 'when identical #data' do
          it 'returns true' do
            expect(uuid).to receive(:data).and_return(data)
            expect(uuid == other).to be_truthy
          end
        end

        context 'when not identical #data' do
          it 'returns false' do
            expect(uuid == other).to be_falsy
          end
        end
      end

      context 'when other not respond to #data' do
        it 'returns false' do
          expect(uuid == 'foo').to be_falsy
        end
      end
    end
  end

  describe '#===' do
    context 'when other respond to #to_str' do
      context 'when identical' do
        let(:other) do
          double(RUUID::UUID, to_str: uuid.to_str)
        end

        it 'returns true' do
          expect(uuid === other).to be_truthy
        end
      end

      context 'when not identical' do
        let(:other) do
          double(RUUID::UUID, to_str: 'baz')
        end

        it 'returns false' do
          expect(uuid === other).to be_falsy
        end
      end
    end

    context 'when other not respond to #to_str' do
      let(:other) do
        double
      end

      it 'returns false' do
        expect(uuid === other).to be_falsy
      end
    end
  end

  describe '#<=>' do
    context 'when other respond to #data' do
      context 'when identical #data' do
        it 'returns 0' do
          expect(uuid).to receive(:data).and_return(data)
          expect(uuid <=> other).to be_zero
        end
      end

      context 'when greater than other#data' do
        let(:other) do
          double(RUUID::UUID, data: 'def')
        end

        it 'returns -1' do
          expect(uuid).to receive(:data).and_return('abc')
          expect(uuid <=> other).to eq(-1)
        end
      end

      context 'when less than other#data' do
        let(:other) do
          double(RUUID::UUID, data: 'abc')
        end

        it 'returns 1' do
          expect(uuid).to receive(:data).and_return('def')
          expect(uuid <=> other).to eq(1)
        end
      end
    end

    context 'when other not respond to #data' do
      it 'returns super' do
        expect(uuid <=> 'bar').to be_nil
      end
    end
  end
end

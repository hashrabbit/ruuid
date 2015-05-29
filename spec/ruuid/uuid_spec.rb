require 'spec_helper'

describe RUUID::UUID do
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
end

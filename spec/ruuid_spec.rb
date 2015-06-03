require 'spec_helper'

describe RUUID do
  describe '.default_generator' do
    it 'defaults to RUUID::Generators::V4' do
      expect(RUUID.default_generator).to eq(RUUID::Generators::V4)
    end
  end

  describe '.default_format' do
    it 'defaults to :canonical' do
      expect(RUUID.default_generator).to eq(RUUID::Generators::V4)
    end
  end
end

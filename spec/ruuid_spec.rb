require 'spec_helper'

describe RUUID do
  describe '.default_format' do
    it 'defaults to :canonical' do
      expect(RUUID.default_generator).to eq(RUUID::Generators::V4)
    end
  end
end

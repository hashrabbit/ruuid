require 'spec_helper'

describe RUUID::Generators::V4 do
  subject(:uuid) do
    RUUID::UUID.new(RUUID::Generators::V4.generate)
  end

  it 'generates version 4 UUIDs' do
    expect(uuid.version).to eq(4)
  end
end

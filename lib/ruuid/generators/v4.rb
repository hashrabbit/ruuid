require 'securerandom'

module RUUID
  module Generators
    class V4
      include Generator

      version 4
      source ->{ SecureRandom.random_bytes(16) }
    end
  end
end

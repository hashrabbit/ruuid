require 'ruuid/version'

require 'ruuid/formatter'

module RUUID
  extend self

  attr_accessor :default_format
  self.default_format = :canonical
end

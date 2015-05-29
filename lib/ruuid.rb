require 'ruuid/version'

require 'ruuid/formatter'
require 'ruuid/generator'
require 'ruuid/generators/v4'
require 'ruuid/parser'
require 'ruuid/uuid'

module RUUID
  extend self

  attr_accessor :default_generator
  self.default_generator = Generators::V4

  attr_accessor :default_format
  self.default_format = :canonical

  def generate
    default_generator.generate
  end
end

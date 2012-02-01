$:.unshift(File.dirname(__FILE__))

require 'moby/version'
require "moby/parts_of_speech"

module Moby
  def self.base_path
    File.expand_path("../..", __FILE__)
  end
end

$:.unshift(File.dirname(__FILE__))

require 'moby/version'
require 'moby/base'
require 'moby/parts_of_speech'
require 'moby/hyphenator'
require 'moby/thesaurus'
require 'moby/words'

module Moby
  def self.base_path
    File.expand_path("../..", __FILE__)
  end
end

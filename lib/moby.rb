$:.unshift(File.dirname(__FILE__))

module Moby
  VERSION = "0.0.1"

  autoload :PartsOfSpeech, "moby/parts_of_speech.rb"

  def self.base_path
    File.expand_path("../..", __FILE__)
  end
end

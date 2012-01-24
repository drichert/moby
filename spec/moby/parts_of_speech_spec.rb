require 'spec_helper'

module Moby
  describe PartsOfSpeech do
    its(:pos) { should be_a(Hash) }
  end
end

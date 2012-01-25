require 'spec_helper'
require 'yaml'

module Moby
  describe PartsOfSpeech do
    let(:pos) { PartsOfSpeech.new }

    subject { pos }
    its(:pos) { should be_a(Hash) }

    describe "@pos Hash" do
      subject { pos.pos }

      # it "debug" do
      #   puts YAML.dump(subject)
      # end

      its(["aback"])       { should == "v" }
      its(["backbit"])     { should == "V" }
      its(["commonplace"]) { should == "AN" }
      its(["daydreamy"])   { should == "A" }
      its(["etymologise"]) { should == "ti" }
    end
  end
end

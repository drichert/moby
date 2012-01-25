require 'spec_helper'
require 'yaml'

module Moby
  describe PartsOfSpeech do
    let(:pos) { PartsOfSpeech.new }

    describe "@pos" do
      subject { pos.instance_variable_get(:@pos) }

      it { should be_a(Hash) }

      its(["aback"])       { should == "v" }
      its(["backbit"])     { should == "V" }
      its(["commonplace"]) { should == "AN" }
      its(["daydreamy"])   { should == "A" }
      its(["etymologise"]) { should == "ti" }
      its(["flam"])        { should == "NV" }
      its(["garnishee"])   { should == "NVt" }
    end
  end
end

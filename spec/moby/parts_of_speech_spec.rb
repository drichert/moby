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

    describe "#find" do
      describe "rabbling" do
        subject { pos.find("rabbling") }
        its([:word]) { should == "rabbling" }
        its([:code]) { should == "Vti" }
        its([:pos]) {
          should == [:verb_usu_participle, :verb_transitive, :verb_intransitive]
        }
      end

      describe "saccharine" do
        subject { pos.find("saccharine") }
        its([:word]) { should == "saccharine" }
        its([:code]) { should == "A" }
        its([:pos])  { should == [:adjective] }
      end

      describe "tailgate" do
        subject { pos.find("tailgate") }
        its([:word]) { should == "tailgate" }
        its([:code]) { should == "NV" }
        its([:pos])  { should == [:noun, :verb_usu_participle] }
      end

      describe "ulcerously" do
        subject { pos.find("ulcerously") }
        its([:word]) { should == "ulcerously" }
        its([:code]) { should == "v" }
        its([:pos])  { should == [:adverb] }
      end
    end
  end
end

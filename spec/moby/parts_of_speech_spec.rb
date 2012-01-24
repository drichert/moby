require 'spec_helper'

module Moby
  describe PartsOfSpeech do
    let(:pos) { PartsOfSpeech.new }

    subject { pos }
    its(:pos) { should be_a(Hash) }

    describe "@pos Hash" do
      subject { pos.pos }

      describe "A1c" do
        it { should have_key("A1c") }
        its(["A1c"]) { should == "N" }
      end

      describe "backbit" do
        it { should have_key("backbit") }
        its(["backbit"]) { should == "V" }
      end
    end
  end
end

require 'spec_helper'

module Moby
  describe Hyphenator do
    let(:hyph) { Hyphenator.new }

    describe "#hyphenate" do
      def h(word)
        hyph.hyphenate(word)
      end

      describe "swordcraft" do
        specify { h("swordcraft").should == "sword-craft" }
      end

      describe "California poppy" do
        specify { h("California poppy").should == "Cal-i-for-ni-a pop-py" }
      end

      describe "unstandardized" do
        specify { h("unstandardized").should == "un-stand-ard-ized" }
      end

      describe "recede" do
        specify { h("recede").should == "re-cede" }
      end

      describe "unlisted words are returned unchanged" do
        describe "Dwalin" do
          specify { h("Dwalin").should == "Dwalin" }
        end

        describe "Balin" do
          specify { h("Balin").should == "Balin" }
        end

        describe "Kili" do
          specify { h("Kili").should == "Kili" }
        end

        describe "Fili" do
          specify { h("Fili").should == "Fili" }
        end
      end
    end
  end
end

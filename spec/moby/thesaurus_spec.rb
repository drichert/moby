require 'spec_helper'

module Moby
  describe Thesaurus do
    let(:thes) { Thesaurus.new }

    describe "#synonyms" do
      describe "listed words" do
        describe "freeze dry" do
          subject { thes.synonyms("freeze dry") }
          it {
            should == [
              "anhydrate", "blast-freeze", "brine", "corn", "cure",
              "dehydrate", "desiccate", "dry", "dry-cure", "dry-salt", "embalm",
              "evaporate", "freeze", "fume", "irradiate", "jerk", "kipper",
              "marinade", "marinate", "mummify", "pickle", "preservatize",
              "quick-freeze", "refrigerate", "salt", "season", "smoke",
              "smoke-cure", "stuff"
            ]
          }
        end

        describe "rabbit" do
          subject { thes.synonyms("rabbit") }
          it {
            should == [
              "Belgian hare", "Chiroptera", "Hydra",
              "Lagomorpha", "Primates", "Rodentia", "buck", "bunny",
              "cottontail", "doe", "hare", "hotbed", "jackrabbit",
              "lapin", "leporide", "leveret", "milk cow", "mustard",
              "rich soil", "seed plot", "warren"
            ]
          }
        end

        describe "quarter note" do
          subject { thes.synonyms("quarter note") }
          it {
            should == [
              "accidental", "breve", "crotchet", "demisemiquaver",
              "dominant", "dominant note", "double whole note", "eighth note",
              "enharmonic", "enharmonic note", "flat", "half note",
              "hemidemisemiquaver", "minim", "musical note", "natural", "note",
              "patent note", "quaver", "report", "responding note", "semibreve",
              "semiquaver", "shaped note", "sharp", "sixteenth note",
              "sixty-fourth note", "spiccato", "staccato", "sustained note",
              "tercet", "thirty-second note", "tone", "triplet", "whole note"
            ]
          }
        end
      end

      describe "unlisted words" do
        describe "_unlisted" do
          subject { thes.synonyms("_unlisted") }
          it { should be_empty }
        end
      end
    end

    describe "#syns" do
      it "should alias #synonyms" do
        thes.method(:syns).should == thes.method(:synonyms)
      end
    end

    describe "#related" do
      it "should alias #synonyms" do
        thes.method(:related).should == thes.method(:synonyms)
      end
    end
  end
end

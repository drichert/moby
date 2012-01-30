require 'spec_helper'
require 'yaml'

module Moby
  describe PartsOfSpeech do
    let(:pos) { PartsOfSpeech.new }

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

    describe "wordlist by part of speech" do
      describe "#nouns" do
        subject { pos.nouns }
        it { should include("abaca", "unchildishness", "transcription" ) }
      end

      describe "#plurals" do
        subject { pos.plurals }
        it { should include("transennae", "uranalyses", "waterfowls" ) }
      end

      describe "#noun_phrases" do
        subject { pos.noun_phrases }
        it { should include(
          "waxed paper", "Joan of Arc", "absence of mind"
        )}
      end

      describe "#verbs" do
        describe ":type not given" do
          subject { pos.verbs }
          it { should include(*%w{jobbed outproducing about-shipping}) }
        end

        describe ":type => :all" do
          subject { pos.verbs(:type => :all) }
          it { should include(*%w{jobbed outproducing about-shipping}) }
        end

        describe ":type => :usu" do
          subject { pos.verbs(:type => :usu) }
          it { should include("jobbed", "lattice", "minify" ) }
        end

        describe ":type => :transitive" do
          subject { pos.verbs(:type => :transitive) }
          it { should include("misgauged", "outproducing", "parade" ) }
        end

        describe ":type => :intransitive" do
          subject { pos.verbs(:type => :intransitive) }
          it { should include("paralogized", "skreegh", "about-shipping" ) }
        end
      end

      describe "#adjectives" do
        subject { pos.adjectives }
        it { should include("about", "garrulous", "hesperideous" ) }
      end

      describe "#adverbs" do
        subject { pos.adverbs }
        it { should include("heterodoxly", "nondiabolically", "stoutly" ) }
      end

      describe "#conjunctions" do
        subject { pos.conjunctions }
        it { should include("syne", "lest", "notwithstanding" ) }
      end

      describe "#prepositions" do
        subject { pos.prepositions }
        it { should include("off", "senza", "except" ) }
      end

      describe "#interjections" do
        subject { pos.interjections }
        it { should include("eyes front", "horsefeathers", "jeepers" ) }
      end

      describe "#pronouns" do
        subject { pos.pronouns }
        it { should include("lot", "me", "noblewoman" ) }
      end

      describe "#definite_articles" do
        subject { pos.definite_articles }
        it { should include("no", "other", "per" ) }
      end

      describe "#indefinite_articles" do
        pending("No definite articles in current Moby POS")
      end

      describe "#nominatives" do
       pending("No nominatives in current Moby POS")
      end
    end

    describe "query methods" do
      describe "#noun?" do
        %w{gait teaspoon decorum}.each do |word|
          subject { pos.noun?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#plural?" do
        %w{waterleafs xoanona argosies}.each do |word|
          subject { pos.plural?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#noun_phrase?" do
        ["argon potassium dating",
         "nonharmonic tone",
         "nook shaft"].each do |word|
          subject { pos.noun_phrase?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#adjective?" do
        %w{nonzonated oliguretic conservable}.each do |word|
          subject { pos.adjective?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#adverb?" do
        %w{evaporatively hyperactively lonesomely}.each do |word|
          subject { pos.adverb?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#conjunction?" do
        %w{moreover saving opuscule}.each do |word|
          subject { pos.conjunction?(word) }
          describe(word) { it { should be_true } }
        end
      end
    end

  end
end

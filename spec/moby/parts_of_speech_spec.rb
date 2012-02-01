require 'spec_helper'
require 'yaml'

module Moby
  describe PartsOfSpeech do
    let(:pos) { PartsOfSpeech.new }

    describe "#find" do
      describe "all words" do
        let(:word) { "purple" }
        subject { pos.find(word) }
        its([:word])  { should == word }
      end

      describe "unlisted word" do
        let(:word) { "_unlisted" }
        subject { pos.find(word) }
        its([:found]) { should be_false }
      end

      describe "listed word" do
        let(:word) { "noise limiter" }
        subject { pos.find(word) }
        its([:found]) { should be_true }
      end

      describe "_unlisted" do
        let(:word) { "_unlisted" }
        subject { pos.find(word) }
        its([:word])  { should == word }
        its([:found]) { should be_false }
        its([:code])  { should == "" }
        its([:pos])   { should == [] }
      end

      describe "specific words" do
        describe "rabbling" do
          subject { pos.find("rabbling") }
          its([:code]) { should == "Vti" }
          its([:pos]) {
            should == [:verb_usu_participle, :verb_transitive, :verb_intransitive]
          }
        end

        describe "saccharine" do
          subject { pos.find("saccharine") }
          its([:code]) { should == "A" }
          its([:pos])  { should == [:adjective] }
        end

        describe "tailgate" do
          subject { pos.find("tailgate") }
          its([:code]) { should == "NV" }
          its([:pos])  { should == [:noun, :verb_usu_participle] }
        end

        describe "ulcerously" do
          subject { pos.find("ulcerously") }
          its([:code]) { should == "v" }
          its([:pos])  { should == [:adverb] }
        end
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
        describe ":type => all or :type not given" do
          subject { pos.verbs }
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

      describe "#preposition?" do
        %w{of outside between}.each do |word|
          subject { pos.preposition?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#interjection?" do
        %w{bingo halt viva}.each do |word|
          subject { pos.interjection?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#pronoun?" do
        %w{nobody hisself whereinto}.each do |word|
          subject { pos.pronoun?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#definite_article?" do
        %w{no more enough}.each do |word|
          subject { pos.definite_article?(word) }
          describe(word) { it { should be_true } }
        end
      end

      describe "#indefinite_aticle?" do
        pending("No definite articles in current Moby POS")
      end

      describe "#nominative?" do
        pending("No nominatives in current Moby POS")
      end

      describe "#verb?" do
        describe ":type => :all or :type not given" do
          %w{dwelled hypostasize pose}.each do |word|
            describe word do
              subject { pos.verb?(word, :type => :all) }
              it { should be_true }
            end
          end
        end

        describe ":type => :usu" do
          %w{regrinding shimmy resalute}.each do |word|
            describe word do
              subject { pos.verb?(word, :type => :all) }
              it { should be_true }
            end
          end
        end

        describe ":type => :transitive" do
          %w{resampled agitate eternalizing}.each do |word|
            describe word do
              subject { pos.verb?(word, :type => :all) }
              it { should be_true }
            end
          end
        end

        describe ":type => :intransitive" do
          %w{joy-ridden superaccruing bing}.each do |word|
            describe word do
              subject { pos.verb?(word, :type => :all) }
              it { should be_true }
            end
          end
        end

      end
    end

  end
end

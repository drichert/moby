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
      describe "#noun" do
        subject { pos.noun }
        it { should include("abaca", "unchildishness", "transcription" ) }
      end

      describe "#plural" do
        subject { pos.plural }
        it { should include("transennae", "uranalyses", "waterfowls" ) }
      end

      describe "#noun_phrase" do
        subject { pos.noun_phrase }
        it { should include(
          "waxed paper", "Joan of Arc", "absence of mind"
        )}
      end

      describe "#verb_usu_participle" do
        subject { pos.verb_usu_participle }
        it { should include("jobbed", "lattice", "minify" ) }
      end

      describe "#verb_transitive" do
        subject { pos.verb_transitive }
        it { should include("misgauged", "outproducing", "parade" ) }
      end

      describe "#verb_intransitive" do
        subject { pos.verb_intransitive }
        it { should include("paralogized", "skreegh", "about-shipping" ) }
      end

      describe "#adjective" do
        subject { pos.adjective }
        it { should include("about", "garrulous", "hesperideous" ) }
      end

      describe "#adverb" do
        subject { pos.adverb }
        it { should include("heterodoxly", "nondiabolically", "stoutly" ) }
      end

      describe "#conjunction" do
        subject { pos.conjunction }
        it { should include("syne", "lest", "notwithstanding" ) }
      end

      describe "#preposition" do
        subject { pos.preposition }
        it { should include("off", "senza", "except" ) }
      end

      describe "#interjection" do
        subject { pos.interjection }
        it { should include("eyes front", "horsefeathers", "jeepers" ) }
      end

      describe "#pronoun" do
        subject { pos.pronoun }
        it { should include("lot", "me", "noblewoman" ) }
      end

      describe "#definite_article" do
        subject { pos.definite_article }
        it { should include("no", "other", "per" ) }
      end

      describe "#indefinite_article" do
        pending("No definite articles in current Moby POS")
      end

      describe "#nominative" do
       pending("No nominatives in current Moby POS")
      end
    end

    describe "#noun?" do
      ["accuracy", "bailiff", "Dada"].each do |word|
        describe "\"#{word}\"" do
          subject { pos.noun?(word) }
          it { should be_true }
        end
      end

      ["fifty-fifty", "hutting", "impermeably"].each do |word|
        describe "\"#{word}\"" do
          subject { pos.noun?(word) }
          it { should be_false }
        end
      end
    end

    describe "#respond_to?" do
      [:noun, :plural, :noun_phrase, :verb_usu_participle, :verb_transitive,
       :verb_intransitive, :adjective, :adverb, :conjunction, :preposition,
       :interjection, :pronoun, :definite_article, :indefinite_article,
       :nominative].each do |meth|
        it { should respond_to(meth) }
        it { should respond_to("#{meth}?".to_sym) }
      end
    end
  end
end

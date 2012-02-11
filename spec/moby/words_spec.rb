require 'spec_helper'

module Moby
  describe Words do
    let(:words) { Moby::Words.new }

    describe "#acronyms" do
      subject { words.acronyms }
      it { should include(*%w{AAA HEAP MTech NAVDAC}) }
    end

    describe "#common" do
      subject { words.common }
      it { should include(*%w{Dundee ablate nova slopwork}) }
    end

    describe "#compound" do
      subject { words.compound }
      it { should include("-age", "ACE mixture", "Barmecide feast", "salt box")  }
    end

    describe "#crossword" do
      subject { words.crossword }
      it { should include("abattoir", "supervise", "tabering", "zymases")  }
    end

    describe "#crossword_additions" do
      subject { words.crossword_additions }
      it { should include("indie", "kayaked", "lahars", "progeria")  }
    end

    describe "#fiction" do
      subject { words.fiction }
      it { should include("10330<w>", "1896<at >", "1161<pe>", "812<out>")  }
    end

    describe "#freq" do
      subject { words.freq }
      it { should include("the", "down", "very", "service")  }
    end

    describe "#freq_usenet_92" do
      pending
    end

    describe "#kjvfreq" do
      pending
    end

    describe "#names" do
      pending
    end

    describe "#female_names" do
      pending
    end

    describe "#male_names" do
      pending
    end

    describe "#misspelled" do
      pending
    end

    describe "#places" do
      pending
    end

    describe "#single" do
      pending
    end

    describe "#us_constitution" do
      pending
    end
  end
end

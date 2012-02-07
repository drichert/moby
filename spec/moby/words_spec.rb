require 'spec_helper'

module Moby
  describe Words do
    let(:words) { Moby::Words.new }

    describe "#acronyms" do
      subject { words.acronyms }
      it { should include("AAA", "HEAP", "MTech", "NAVDAC") }
    end

    describe "#common" do
      pending
    end

    describe "#compound" do
      pending
    end

    describe "#crossword" do
      pending
    end

    describe "#crossword_additions" do
      pending
    end

    describe "#fiction" do
      pending
    end

    describe "#freq" do
      pending
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

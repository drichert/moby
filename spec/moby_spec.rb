require 'spec_helper'

describe Moby do
  describe "::VERSION" do
    it "should be a valid SemVer string" do
      Moby::VERSION.should match(/^(\d+\.){2}\d+([a-z](\w+)?)?$/)
    end
  end

  describe "::base_path" do
    it "should return the absolute root path of the application" do
      Moby::base_path.should == File.expand_path("../..", __FILE__)
    end
  end
end

require 'spec_helper'

describe Moby do
  describe "::VERSION" do
    it "should be a valid SemVer string" do
      Moby::VERSION.should match(/^(\d+\.){2}\d+([a-z](\w+)?)?$/)
    end
  end
end

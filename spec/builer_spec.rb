require 'croaky'

describe Croaky::Builer do
  context "when input is command line format" do
    it "should return hash of option token and value" do
      opts = "-d 82096111 test.ps"
      Croaky::Builer.options(opts).should == {:d => ["82096111"], :file => "test.ps"}
    end
  end

  context "when input is token and value" do
    it "should return hash of option token and value" do
      opts = {:d => ["82096111"] , :file => "test.ps"}
      Croaky::Builer.options(opts).should == {:d => ["82096111"], :file => "test.ps"}
    end
  end
end

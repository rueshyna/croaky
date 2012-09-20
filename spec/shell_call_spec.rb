require 'spec_helper'

describe Croaky::ShellCall do
  context "#take" do
    it "should return value and delete the key" do
      hash = {:c => 1, :b => 2, :a =>3}
      Croaky::ShellCall.take(hash, :a).should == 3
    end
  end

  context "#check_file?" do
    it "should return false" do
      test_file = ["aaa","bbb"]
      (Croaky::ShellCall.check_file?test_file).should == false
    end
  end

  context "#command" do
    it "should command string" do
      opts = {:d => ["82096111","26891543"], :n => false, :P => "23", :facsimile => ["test, test and test"]}
      option_set = Croaky::OptionSet.options(opts)
      Croaky::ShellCall.command(option_set).should == ["-P 23 -d 82096111 -d 26891543 ","test, test and test"]
    end
  end
end

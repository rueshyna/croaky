require 'spec_helper'

describe Croaky::OptionSet do

  context "when initialize OptionSet" do
    it "should return initialize option" do
      croaky = Croaky::OptionSet.new
      croaky.options_status == ({:d => [], :n => false, :P => "", :facsimile => []})
    end
  end

  context "when input is command line format" do
    it "should set a destination and facsimile" do
      opts = "-d 82096111 test.ps"
      Croaky::OptionSet.options(opts).options_status.should == ({:d => ["82096111"], :n => false, :P => "", :facsimile => ["test.ps"]})
    end

    it "should set two destinations and a facsimile" do
      opts = "-d 82096111 -d 26891543 test.ps"
      Croaky::OptionSet.options(opts).options_status.should == ({:d => ["82096111","26891543"], :n => false, :P => "", :facsimile => ["test.ps"]})
    end

    it "should set all" do
      opts = "-n -P 23 -d 82096111 -d 26891543 test.ps"
      Croaky::OptionSet.options(opts).options_status.should == ({:d => ["82096111","26891543"], :n => true, :P => "23", :facsimile => ["test.ps"]})
    end
  end

  context "when input are tokens and values" do
    it "should set tokens of destination and facsimile" do
      opts = "-d 82096111 test.ps"
      opts = {:d => ["82096111"] , :facsimile => ["test.ps"]}
      Croaky::OptionSet.options(opts).options_status.should == ({:d => ["82096111"], :n => false, :P => "", :facsimile => ["test.ps"]})
    end

    it "should set tokens of two destinations and a facsimile" do
      opts = {:d => ["82096111","26891543"] , :facsimile => ["test.ps"]}
      Croaky::OptionSet.options(opts).options_status.should == ({:d => ["82096111","26891543"], :n => false, :P => "", :facsimile => ["test.ps"]})
    end

    it "should set all" do
      opts = {:n => true, :P => "23", :d => ["82096111","26891543"] ,:facsimile=>["test.ps"]}
      Croaky::OptionSet.options(opts).options_status.should == ({:d => ["82096111","26891543"], :n => true, :P => "23", :facsimile => ["test.ps"]})
    end
  end

  context "when new OptionSet to set option" do
    before do
      @croaky = Croaky::OptionSet.new
    end

    context "it tests string option" do
      it "set string option" do
        opts = "-d 82096111 -d 26891543 test.ps"
        @croaky.string_option(opts).options_status.should == ({:d => ["82096111","26891543"], :n => false, :P => "", :facsimile => ["test.ps"]})
      end

      # it should all facsimile or massage...
      it "reset string option" do
        opts = "-d 82096111 -d 26891543 test.ps"
        @croaky.string_option(opts)
      end
    end

    context "it tests option" do
      it "should log the exception" do
         @croaky.option(:d,["9876543"])
         @croaky.options_status.should == ({:d => ["9876543"], :n => false, :P => "", :facsimile => []})
      end
    end

    context "it should return option status" do
      it "it should return []" do
        @croaky.option_status(:d).should == []
      end
    end
  end
end


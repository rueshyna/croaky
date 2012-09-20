require 'spec_helper'

describe Croaky::ParseSendfaxOption do
  it "should parse string option" do
    croaky = Croaky::OptionSet.new
    opts = "-d 82096111 test.ps"
    Croaky::ParseSendfaxOption.parse(croaky,opts.split).options_status.should == ({:d => ["82096111"], :n => false, :P => "", :facsimile => ["test.ps"]})
  end
end

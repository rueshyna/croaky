require 'croaky'

describe Croaky::ParseSendFaxOption do
  it "should parse string option" do
    croaky = Croaky::OptionSet.new
    opts = "-d 82096111 test.ps"
    Croaky::ParseSendFaxOption.parse(croaky,opts.split).options_status.should == ({:d => ["82096111"], :n => false, :P => "", :file => ["test.ps"]})
  end
end

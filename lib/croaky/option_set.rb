require 'croaky/parse_sendfax_option'
require 'croaky/option_set'

module Croaky
  class OptionSet

    def send
      #to execute sendfax
    end

    def self.options(opts)
      option_set = OptionSet.new
      if opts.class.to_s.eql?"String"
         option_set = option_set.string_option opts
      else
        opts.each{|opt, value|
          option_set.option opt,value
        }
      end
      option_set
    end

    def string_option opts
      Croaky::ParseSendFaxOption.parse(self, opts.split)
    end

    def option opt,value
      begin
        @options[opt] = value
      rescue NameError
        warn "invalid option #{opt}"
      end
    end

    def options_status
      options_hash = {}
      @options.each_pair{|opt,value| options_hash[opt] = value}
      options_hash
    end

    def option_status opt
      begin
       @options[opt]
      rescue NameError
        warn "invalid option #{opt}"
      end
    end

    def initialize
      # :file should all file or massage...
      @options = Struct.new(:d,:n,:P,:file).new([],false,"",[])
    end
  end
end

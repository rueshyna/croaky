require 'optparse'

module Croaky
  class ParseSendfaxOption
    def self.parse option_set, opt_of_string
      option_set.option "d", []  #reset destination
      opts = OptionParser.new{|opts|
        # other option : 12DEImNpRwv
        "n".each_char{|char|
          opts.on("-#{char}"){|value|
            option_set.option char,value
          }
        }
        # other option : abBcCfFiklMrstTUVWxXyY
        "P".each_char{|char|
          opts.on("-#{char} VALUE"){|value|
            option_set.option char,value
          }
        }
        opts.on("-d VALUE"){|value|
          dest = option_set.option_status :d
          dest << value
          option_set.option "d", dest
        }
      }
      opts.parse!(opt_of_string)

      if opt_of_string.empty?
        raise "it need file or massage."
      else
        option_set.option :facsimile, opt_of_string
      end
      option_set
    end
  end
end

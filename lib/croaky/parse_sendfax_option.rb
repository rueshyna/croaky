require 'optparse'
module Croaky
  class ParseSendFaxOption
    def self.parse opt_of_string
      hash_of_opt = {}

      opts = OptionParser.new{|opts|
        "12DEImnNpRwv".each_char{|char|
          opts.on("-#{char}"){|value|
            hash_of_opt[char.to_sym] = value
          }
        }
        "abBcCfFiklMPrstTUVWxXyY".each_char{|char|
          opts.on("-#{char} VALUE"){|value|
            hash_of_opt[char.to_sym] = value
          }
        }
        opts.on("-d VALUE"){|value|
          if hash_of_opt[:d].nil?
            hash_of_opt[:d] << [value]
          else
            hash_of_opt[:d] << value
          end
        }
      }
      opts.parse!(opt_of_string)
      hash_of_opt[:file] = opt_of_string[0]
      hash_of_opt
    end
  end
end

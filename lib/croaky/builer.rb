require 'croaky/parse_sendfax_option'

class Croaky::Builer
  include ParseSendFaxOption
  def self.options(*opts)
    hash_of_opt = {}
    if opts.size == 1 && opts.class == "String"
      hash_of_opt = ParseSendFaxOption.parser(opts[0]).merge(hash_of_opt){|opt,val1,val2| val1+val2}
    else
      opts.each{|opt, value|
       hash_of_opt = Builer.new(opt,value).merge.hash_of_ops
      }
    end
    hash_of_opt
  end

  def initialize opt, value
    {opt.to_sym,value}
  end
end

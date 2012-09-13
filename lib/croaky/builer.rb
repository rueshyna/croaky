require 'croaky/parse_sendfax_option'

class Croaky::Builer
  def self.options(opts)
    hash_of_opt = {}
    if opts.class.to_s == "String"
      hash_of_opt = Croaky::ParseSendFaxOption.parse(opts.split).merge(hash_of_opt){|opt,val1,val2| val1+val2}
    else
      opts.each{|opt, value|
       hash_of_opt = option(opt,value).merge hash_of_opt
      }
    end
    hash_of_opt
  end

  def self.option opt, value
    {opt.to_sym=>value}
  end

  def initialize
  end
end

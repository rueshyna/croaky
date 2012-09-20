require 'croaky'

opts_1 = "-d 82096111 -d 98989898 -n test1.ps test2.ps"
option_set_1 = Croaky::OptionSet.options(opts_1)
option_set_1.option(:n, false)
option_set_1.string_option("-P 123 -d 09876543 test4.ps")
puts "\nThis is sample 1 :"
p option_set_1.options_status
option_set_1.send

opts_2 = {:d => ["82096111","98989898"], :n => true , :facsimile => ["test1.ps","test2.ps"] }
option_set_2 = Croaky::OptionSet.options(opts_2)
option_set_2.option(:n, false)
option_set_2.string_option("-P 123 -d 09876543 test4.ps")
puts "\nThis is sample 2 :"
p option_set_2.options_status
option_set_2.send

option_set_3 = Croaky::OptionSet.new
option_set_3.string_option(opts_1)
option_set_3.option(:n, false)
puts "\nThis is sample 3 :"
p option_set_3.options_status
option_set_3.send

option_set_4 = Croaky::OptionSet.new
option_set_4.option(:d, ["09873456"])
option_set_4.option(:n, false)
option_set_4.option(:facsimile, ["test1.ps","test3.ps"])
puts "\nThis is sample 4 :"
p option_set_4.options_status
option_set_4.send

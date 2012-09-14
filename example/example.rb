require 'croaky'

opts_1 = "-d 82096111 -d 98989898 -n test1.ps test2.ps"
option_set_1 = Croaky::OptionSet.options(opts1)
option_set_1.option(:n, false)
option_set_1.option_string("-P 123 -d 09876543")
p option_set_1.options_status

opts_2 = {:d => ["82096111","98989898"], :n => true , :file => ["test1.ps","test2.ps"] }
option_set_2 = Croaky::OptionSet.options(opts2)
option_set_2.option(:n, false)
option_set_2.option_string("-P 123 -d 09876543")
p option_set_2.options_status

option_set_3 = Croaky::OptionSet.new
option_set_3.option_string(opts1)
option_set_3.option(:n, false)
p option_set_3.options_status

option_set_4 = Croaky::OptionSet.new
option_set_4.option(:d, ["09873456"])
option_set_4.option(:n, false)
p option_set_4.options_status

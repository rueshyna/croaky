require 'open3'

module Croaky
  class ShellCall
    class << self
      def command option_set
        option_hash = option_set.options_status.delete_if{|option,value| value.eql?false or value.nil?}
        facsimile = take option_hash,:facsimile
        destination = take option_hash,:d
        command_string = option_hash.to_a.map{|opt,value|
          if value.eql?true
           "-#{opt}"
          else
           ["-#{opt}",value].join(" ")
          end
        }.join(" ")

        destination_string = destination.map{|d| "-d #{d}"}.join(" ")

        if check_file? facsimile
          file_string = facsimile.join(" ")
          message_string = ""
        else
          file_string = ""
          message_string = facsimile.join(" ")
        end

        command_string = "#{command_string} #{destination_string} #{file_string}"
        [command_string,message_string]

      end

      def check_file? facsimile
        facsimile.each{|f| 
          if not File.file?f
            return false
          end
        }
      end

      def take hash,key
        value = hash[key]
        hash.delete key
        value
      end

      def execute command,message
        Open3.popen3("sendfax #{command}"){ |stdin, stdout, stderr|
          if not message.nil?
            stdin.write message
          end
          stdin.close
          puts stdout.read
          warn stderr.read
        }
      end
    end
  end
end

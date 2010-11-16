require 'json'
require 'pp'

local_filename = "TODO"

ARGV.each_with_index do |arg, index|
  p arg
  if arg == "-f"
    local_filename=  ARGV[index + 1]
  end
end


data = "TODO"

 if (File.exists? local_filename)
      #get the existing data
      p "going to read " +  local_filename
      File.open(local_filename,'r') {|f|
        data = f.read()
  }
 end
objs = JSON.parse(data)
#p pp(objs)
#objs
p "Cont:" 
p objs["query-continue"]["categorymembers"]["cmcontinue"]
#"File:PrizrenCollection2 2010 100 2714.JPG|"}}

#["categorymembers"]
#.each {|key| puts key }

#objs.each_pair {|key, value| puts "#{key} is #{value}\n" }
p "going to process"
titles = []
objs["query"]["categorymembers"].each {|arrayval| arrayval.each_key{ |key|  titles << arrayval["title"] } }
p "done"
#titles.each{|v| p v}

#bjs["query"].each_key{ |key|
#  key.each {|k| 
#    key.each_key {|key| puts key }
#  k.each {|j| 
#  k.each {|j| 
#    print "" + j + "\n"
#    }
#}



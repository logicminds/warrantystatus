# warrantystatus.rb
if  FileTest.exists?("/etc/warrantystatusfile.txt")
Facter.add("warrantyend") do
        setcode do
		thefact = ''
		# code to parse file 
                file = File.open("/etc/warrantystatusfile.txt", "r")
		file.each { |line
			 matchobj = line.match(/^end_date/i)
			 next if not matchobj
                         # get the status
			 thefact = matchobj[1].split('=')[1]
			 break			 
		}
		file.close
		return thefact
                
        end
end

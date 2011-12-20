# warrantystatus.rb
if  FileTest.exists?("/etc/warrantystatusfile.txt")
Facter.add("warrantystatus") do
        setcode do
		# code to parse file 
                file = File.open("/etc/warrantystatusfile.txt", "r")
		file.each { |line
			 matchobj = line.match(/^status/i)
			 next if not matchobj
                         # get the status
			 matchobj[1].split('=')[1]
		}
                
        end
end

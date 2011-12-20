# warrantystatus.rb
if  FileTest.exists?("/etc/warrantystatusfile.txt")
Facter.add("warrantystatus") do
        setcode do
                thefact = ''
                # code to parse file
                file = File.open("/etc/warrantystatusfile.txt", "r")
                file.each { |line
                         matchobj = line.match(/^status/i)
                         next if not matchobj
                         # get the status
                         thefact = matchobj[1].split('=')[1].chomp
                         break
                }
                file.close
                return thefact

        end
end

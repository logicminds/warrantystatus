require 'warranty-check'

module Puppet::Parser::Functions
	newfunction(:warrantystatus, :type => :rvalue) do  | args |
	    manufacturer = lookupvar('manufacturer').to_s
	    serial = lookupvar('serialnumber').to_s

	    case manufacturer
	    	when "HP"
	    		oem = WarrantyCheck::HP.new(serial)	
			when "IBM"
				oem = WarrantyCheck::IBM.new(serial)
			when "Apple"
				oem = WarrantyCheck::Apple.new(serial)
			when "dell"
				oem = WarrantyCheck::Dell.new(serial)
			when "fujitsu"
				oem = WarrantyCheck::Fujitsu.new(serial)
			else
				# New vendor here
				return
			end
			
		# Get the warranty data from the website and parse the information
		oem.check if oem
		# Return the warranty data 
		oem.warranties
		
		
	end
end



		
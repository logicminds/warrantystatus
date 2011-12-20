# Class: warrantystatus
#
# This module manages warrantystatus
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class warrantystatus {


	file{"warrantystatus":
		owner => root,
		group => root,
		mode => 644,
		path => "/etc/warrantystatusfile.txt",
		content => template("warrantystatus/warrantystatusfile.rb")
    }
    
}

-- Version Checker do not remove --

function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

local branding = 
[[
|| 
|| $$\   $$\           $$\   $$\           
|| $$$\  $$ |          $$$\  $$ |          
|| $$$$\ $$ | $$$$$$\  $$$$\ $$ | $$$$$$\  
|| $$ $$\$$ |$$  __$$\ $$ $$\$$ |$$  __$$\ 
|| $$ \$$$$ |$$ /  $$ |$$ \$$$$ |$$ /  $$ |
|| $$ |\$$$ |$$ |  $$ |$$ |\$$$ |$$ |  $$ |
|| $$ | \$$ |\$$$$$$  |$$ | \$$ |\$$$$$$  |
|| \__|  \__| \______/ \__|  \__| \______/ 
||                                                                                 
   ]]

-- Grabs the latest version number from the web GitHub
PerformHttpRequest( "https://github.com/NoNoTheGoat/3D-Text-With-Blip", function( err, text, headers )
	-- Wait to reduce spam
	Citizen.Wait( 2000 )

	-- Print the branding!
	print( branding )

	-- Get the current resource version
	local curVer = GetCurrentVersion()

	print( "  ||    Current version: " .. curVer )

	if ( text ~= nil ) then
		-- Print latest version
		print( "  ||    Latest recommended version: " .. text .."\n  ||" )

		-- If the versions are different, print it out
		if ( text ~= curVer ) then
			print( "  ||    ^1Your 3D Text Script version is outdated, visit the github post to get the latest version.\n^0  \\\\\n" )
		else
			print( "  ||    ^3D Text Script is up to date!\n^0  ||\n  \\\\\n" )
		end
	else
		-- In case the version can not be requested, print out an error message
		print( "  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n" )
	end
end )

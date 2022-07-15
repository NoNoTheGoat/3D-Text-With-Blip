-- Version Checker do not remove --

function GetCurrentVersion()
	return GetResourceMetadata( GetCurrentResourceName(), "version" )
end

local branding = 
[[
|        _          _         _____
|       | |        | |       |  ___ \ 
|       | |        | |       | |   \ \
|       | |        | |       | |    \ \
|      _|_|________|_|_      | |     \ \
|     |________________|     | |      | |
|       | |        | |       | |      | |
|       | |        | |       | |     / /
|       | |        | |       | |____/ /
|       |_|        |_|       |_______/
|   
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
			print( "  ||    ^1Your Tornado Script version is outdated, visit the FiveM forum post to get the latest version.\n^0  \\\\\n" )
		else
			print( "  ||    ^2Tornado Script is up to date!\n^0  ||\n  \\\\\n" )
		end
	else
		-- In case the version can not be requested, print out an error message
		print( "  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n" )
	end
end )
local CATEGORY_NAME = "Community Links"


// Discord
function ulx.discord(ply)
	ply:SendLua([[gui.OpenURL("https://discord.gg/gmXXZ59")]])
end
local discord = ulx.command( CATEGORY_NAME, "ulx discord", ulx.discord, "!discord" )
discord:defaultAccess( ULib.ACCESS_ALL )
discord:help( "Discord Link." )

// Forums
function ulx.website(ply)
	ply:SendLua([[gui.OpenURL("https://yeetrp.mistforums.com/")]])
end
local website = ulx.command( CATEGORY_NAME, "ulx website", ulx.website, "!website" )
website:defaultAccess( ULib.ACCESS_ALL )
website:help( "Displays our wonderful forums." )

// Forums 
function ulx.website(ply)
	ply:SendLua([[gui.OpenURL("https://yeetrp.mistforums.com/")]])
end
local website = ulx.command( CATEGORY_NAME, "ulx forums", ulx.website, "!forums" )
website:defaultAccess( ULib.ACCESS_ALL )
website:help( "Displays our wonderful forums." )

// Apply For Staff
function ulx.website(ply)
	ply:SendLua([[gui.OpenURL("https://yeetrp.mistforums.com/category/staff-application-537284")]])
end
local website = ulx.command( CATEGORY_NAME, "ulx apply", ulx.website, "!apply" )
website:defaultAccess( ULib.ACCESS_ALL )
website:help( "Apply for staff!" )

// Workshop Page
function ulx.workshop(ply)
	ply:SendLua([[gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=1487756187")]])
end
local workshop = ulx.command( CATEGORY_NAME, "ulx workshop", ulx.workshop, "!workshop" )
workshop:defaultAccess( ULib.ACCESS_ALL )
workshop:help( "Displays out workshop page." )

// Workshop Page
function ulx.workshop(ply)
	ply:SendLua([[gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=1487756187")]])
end
local workshop = ulx.command( CATEGORY_NAME, "ulx work", ulx.workshop, "!work" )
workshop:defaultAccess( ULib.ACCESS_ALL )
workshop:help( "Displays out workshop page." )

// Meth Page
function ulx.meth(ply)
	ply:SendLua([[gui.OpenURL("https://www.youtube.com/watch?v=hYSZoxOSAcQ&feature=youtu.be")]])
end
local meth = ulx.command( CATEGORY_NAME, "ulx meth", ulx.meth, "!meth" )
meth:defaultAccess( ULib.ACCESS_ALL )
meth:help( "Displays out Meth Tutorial page." )

// Oil Page
function ulx.meth(ply)
	ply:SendLua([[gui.OpenURL("https://www.youtube.com/watch?v=CYfvvsF6V2U")]])
end
local oil = ulx.command( CATEGORY_NAME, "ulx oil", ulx.meth, "!oil" )
oil:defaultAccess( ULib.ACCESS_ALL )
oil:help( "Displays out Oil Tutorial page." )
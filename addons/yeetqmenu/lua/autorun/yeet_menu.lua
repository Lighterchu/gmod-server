AddCSLuaFile("autorun/yeet_menu.lua")
newtabaddress = "https://docs.google.com/document/d/1Lb1NWTH-MC6h72BqMabS5zcummQvBBSdeUJ1R5drGwA/edit?ts=5bd14f90"
newTabGenRules = "https://yeetrp.mistforums.com/thread/server-rules-456782"
newtabname =  "Admin Menu"
newtabicon = "icon16/control_repeat_blue.png"
local function removeOldTabls()
		local tabstoremove = {
		language.GetPhrase(newtabname)}
		if(LocalPlayer():IsAdmin()) then return end
		for k, v in pairs( g_SpawnMenu.CreateMenu.Items ) do
		  if table .HasValue(tabstoremove, v.Tab:GetText()) then
	            g_SpawnMenu.CreateMenu:CloseTab( v.Tab, true )
	            removeOldTabls()
	       end 
	 	end 
end




hook.Add("SpawnMenuOpen", "blockmenutabs", removeOldTabls)

local function AdminTab()

end 
hook.Add("SpawnMenuOpen", "blockmenutabs", AdminTab)

if(CLIENT) then
	
	spawnmenu.AddCreationTab( newtabname, function()

			local test = print()

			AdminMenu = vgui.Create( "DHTML" );
			JS_Language( AdminMenu )
			AdminMenu:SetAllowLua( true );
			AdminMenu:SetMouseInputEnabled(true)
			AdminMenu:OpenURL( newtabaddress );

			backPanel = vgui.Create( "DPanel", AdminMenu )
			backPanel:SetPos(0, 120)
			
			genralRulesPanel = vgui.Create( "DPanel", AdminMenu )
			genralRulesPanel:SetPos( 0, 150 )

			
			Backbutton = vgui.Create("DButton",backPanel)
			Backbutton:SetText( "Back To Rules" )
			Backbutton:SizeToContents() 
			Backbutton:SetTall(backPanel:GetTall())
			Backbutton:SetDark( 1 )
			

			genralRulesPanelButton = vgui.Create("DButton",genralRulesPanel)
			genralRulesPanelButton:SetText( "Genral Rules" )
			genralRulesPanelButton:SizeToContents() 
			genralRulesPanelButton:SetTall(genralRulesPanel:GetTall())
			genralRulesPanelButton:SetDark( 1 )
			

			
			function Backbutton:DoClick() -- 
				AdminMenu:OpenURL( newtabaddress );
			end
			
			function genralRulesPanelButton:DoClick()
				AdminMenu:OpenURL(newTabGenRules)
			end
		



		return AdminMenu
				

	end, newtabicon, 200 )
end




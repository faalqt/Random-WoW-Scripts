local greet = function() 

	str = "Hello ".. UnitName("player") .. " RDDT is loaded";
	
	return str;
	
end;

local RDDT = function()
	--Gets rid of floating damage/healing text that appears when taking damage or healing on default unitframes
	PlayerHitIndicator.Show = function() end
	PetHitIndicator.Show = function() end

end;
hooksecurefunc("PlayerFrame_UpdateStatus", function()
   if IsResting("player") then
      PlayerStatusTexture:Hide()
      PlayerRestGlow:Hide()
      PlayerStatusGlow:Hide()
   end
end)

local hideGrypons = function()
	MainMenuBarLeftEndCap:Hide()
	MainMenuBarRightEndCap:Hide()
end;

local darkenFrames = function()
	local frame=CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")

	frame:SetScript("OnEvent", function(self, event, addon)
		if (addon == "Blizzard_TimeManager") then
			for i, v in pairs({PlayerFrameTexture, TargetFrameTextureFrameTexture, PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture,
				PartyMemberFrame1PetFrameTexture, PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture, FocusFrameTextureFrameTexture,
				TargetFrameToTTextureFrameTexture, FocusFrameToTTextureFrameTexture, BonusActionBarFrameTexture0, BonusActionBarFrameTexture1, BonusActionBarFrameTexture2, BonusActionBarFrameTexture3,
				BonusActionBarFrameTexture4, MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2, MainMenuBarTexture3, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1, MainMenuMaxLevelBar2,
				MainMenuMaxLevelBar3, MinimapBorder, CastingBarFrameBorder, FocusFrameSpellBarBorder, TargetFrameSpellBarBorder, MiniMapTrackingButtonBorder, MiniMapLFGFrameBorder, MiniMapBattlefieldBorder,
				MiniMapMailBorder, MinimapBorderTop,
				select(1, TimeManagerClockButton:GetRegions())
			}) do
				v:SetVertexColor(.1, .1, .1) --Was .4 to start
			end

			for i,v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
				v:SetVertexColor(1, 1, 1)
			end

			self:UnregisterEvent("ADDON_LOADED")
			frame:SetScript("OnEvent", nil)
		end
	end)

	for i, v in pairs({ MainMenuBarLeftEndCap, MainMenuBarRightEndCap }) do
		v:SetVertexColor(.35, .35, .35)
	end
end;

local main = function()
	--print(greet())
	--RDDT()
	darkenFrames()
		hideGrypons()
end;
	
main()

local QuietPrep_EventFrame = CreateFrame("Frame")

QuietPrep_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
QuietPrep_EventFrame:RegisterEvent("ARENA_OPPONENT_UPDATE")

QuietPrep_EventFrame:SetScript("OnEvent", QuietPrep_EventHandler)

local function QuietPrep_EventHandler(self, event, ...)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    QuietPrep_Initialize()
  elseif ( event == "ARENA_OPPONENT_UPDATE" ) then
    QuietPrep_ToggleSound()
  end
end

local function QuietPrep_Initialize()
  if ( QuietPrep_CurrentZone("arena") == true and QuietPrep_AuraCheck("Arena Preparation", "player", "NOT_CANCELABLE") == true ) then
    if ( GetCVar("Sound_EnableSFX") == "0" ) then break else QuietPrep_ToggleSound() end
  else
    if ( QuietPrep_SoundFXToggled = true ) then QuietPrep_ToggleSound() end
  end
end

local function QuietPrep_CurrentZone(zone_type)
  local pvpType, _, _ = GetZonePVPInfo()
  if ( pvpType == zone_type ) then return true else return false end
end

local function QuietPrep_AuraCheck(aura, unit, mod)
  local name = AuraUtil.FindAuraByName(aura, unit, mod)
  if ( name == aura ) then return true else return false end
end

local function QuietPrep_PlayerSoundCheck()

end

local function QuietPrep_ToggleSound()
  if ( GetCVar("Sound_EnableSFX") == "0" ) then
    SetCVar("Sound_EnableSFX", 1);
    SetCVar("Sound_EnableAmbience", 1);
    SetCVar("Sound_EnableDialog", 1);
    print("Enabling SoundFXs...")
  else
    SetCVar("Sound_EnableSFX", 0);
    SetCVar("Sound_EnableAmbience", 0);
    SetCVar("Sound_EnableDialog", 0);
    print("Disabling SoundFXs...")
  end
end

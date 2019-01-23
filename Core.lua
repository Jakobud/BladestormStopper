BladestormStopper = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDB-2.0", "FuBarPlugin-2.0")

local L = AceLibrary("AceLocale-2.2"):new("BladestormStopper")

local options = {
  type="group",
  args = {
    auto = {
      type = "toggle",
      name = L["Auto Stop"],
      desc = L["Automatically remove Bladestorm buff when you gain it"],
      get = "IsAuto",
      set = "ToggleAuto",
    },
    stop = {
      type = "execute",
      name = L["Stop"],
      desc = L["Manually remove the Bladestorm buff"],
      func = "Stop",
    },
    showAlert = {
      type = "toggle",
      name = L["Show Alert"],
      desc = L["Show an alert in the chat window when Bladestorm is removed"],
      get = "IsShowAlert",
      set = "ToggleShowAlert",
    },
  }
}

BladestormStopper:RegisterChatCommand(L["Slash Commands"], options)

BladestormStopper:RegisterDB("BladestormStopperDB", "BladestormStopperDBPC")
BladestormStopper:RegisterDefaults("profile", {
  auto = true,
  showAlert = false,
})

-- Fubar configuration
BladestormStopper.hasIcon = true
BladestormStopper.hasNoColor = true
BladestormStopper.defaultMinimapPosition = 180
BladestormStopper.hideWithoutStandby = true
BladestormStopper.cannotAttachToMinimap = true
BladestormStopper.defaultPosition = "LEFT"
BladestormStopper.OnMenuRequest = options


-- Register event when buffs/debuffs change on the player
function BladestormStopper:OnEnable()
  self:RegisterEvent("PLAYER_AURAS_CHANGED")
end

function BladestormStopper:PLAYER_AURAS_CHANGED()
  if self.db.profile.auto == true then
    self:Stop()
  end
end

-- Bladestorm buff texture
local bladestormTexture = "ability_whirlwind"

function BladestormStopper:Stop()
  local i, buffTexture

  -- Iterate through all buffs and debuffs
  for i=0,31 do

    -- Get the buff texture
    buffTexture = GetPlayerBuffTexture(i)

    if not buffTexture then break end

    -- If the Bladestorm buff is found...
    if (string.find(string.lower(buffTexture), bladestormTexture)) then

      -- Remove the buff
      CancelPlayerBuff(i)

      -- Optionally print out an alert
      if self.db.profile.showAlert == true then
        self:Print(L["Bladestorm has been removed"])
      end

      break
    end
  end

end

-- Determine if automatic Bladestorm buff removal is set
function BladestormStopper:IsAuto()
  return self.db.profile.auto
end

-- Toggle whether or not automatic Bladestorm buff removal is set
function BladestormStopper:ToggleAuto()
  self.db.profile.auto = not self.db.profile.auto
end

-- Determine if an alert is shown in chat when the Bladestorm buff is removed
function BladestormStopper:IsShowAlert()
  return self.db.profile.showAlert
end

-- Toggle whether or not to show an alert in chat when the Bladestorm buff is removed
function BladestormStopper:ToggleShowAlert()
  self.db.profile.showAlert = not self.db.profile.showAlert
end

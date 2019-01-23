BladestormStopper = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDB-2.0")

local L = AceLibrary("AceLocale-2.2"):new("BladestormStopper")

local options = {
  type='group',
  args = {
    auto = {
      type = 'toggle',
      name = L["Auto Stop"],
      desc = L["Automatically remove Bladestorm buff when you gain it"],
      get = 'IsAuto',
      set = 'ToggleAuto',
    },
    showOnScreen = {
      type = 'toggle',
      name = L["Show on Screen"],
      desc = L["If set, your message will be displayed on the screen near the top of the game field."],
      get = 'IsShowOnScreen',
      set = 'ToggleShowOnScreen',
    }
  }
}

BladestormStopper:RegisterChatCommand(L["Slash Commands"], options)

BladestormStopper:RegisterDB("BladestormStopperDB", "BladestormStopperDBPC")
BladestormStopper:RegisterDefaults("profile", {
  auto = true,
})

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

    -- If buff is the Ravager's Bladestorm buff texture, cancel the buff
    if (string.find(string.lower(buffTexture), bladestormTexture)) then
      CancelPlayerBuff(i)
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

function BladestormStopper:IsShowOnScreen()
  return self.db.profile.showOnScreen
end

function BladestormStopper:ToggleShowOnScreen()
  self.db.profile.showOnScreen = not self.db.profile.showOnScreen
end

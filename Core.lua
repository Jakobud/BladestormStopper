BladestormStopper = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDB-2.0")

local L = AceLibrary("AceLocale-2.2"):new("BladestormStopper")

local options = {
  type='group',
  args = {
    msg = {
      type = 'text',
      name = L["Message"],
      desc = L["Sets the message to be displayed when you get home."],
      usage = L["<your message>"],
      get = "GetMessage",
      set = "SetMessage",
    },
    showInChat = {
      type = 'toggle',
      name = L["Show in Chat"],
      desc = L["If set, your message will be displayed in the General chat window."],
      get = 'IsShowInChat',
      set = 'ToggleShowInChat',
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
  message = L["Welcome Home!"],
  showInChat = false,
  showOnScreen = true,
})


function BladestormStopper:OnInitialize()

end

function BladestormStopper:OnEnable()
  self:RegisterEvent("PLAYER_AURAS_CHANGED")
end

function BladestormStopper:OnDisable()

end

function BladestormStopper:PLAYER_AURAS_CHANGED()
  self:Print("Buffs Changed")

end

function BladestormStopper:GetMessage()
  return self.db.profile.message
end

function BladestormStopper:SetMessage(value)
  self.db.profile.message = value
end

function BladestormStopper:IsShowInChat()
  return self.db.profile.showInChat
end

function BladestormStopper:ToggleShowInChat()
  self.db.profile.showInChat = not self.db.profile.showInChat
end

function BladestormStopper:IsShowOnScreen()
  return self.db.profile.showOnScreen
end

function BladestormStopper:ToggleShowOnScreen()
  self.db.profile.showOnScreen = not self.db.profile.showOnScreen
end

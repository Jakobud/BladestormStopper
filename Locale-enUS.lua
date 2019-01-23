local L = AceLibrary("AceLocale-2.2"):new("BladestormStopper")

L:RegisterTranslations("enUS", function() return {
  ["Slash Commands"] = { "/bladestormstopper", "/bss"},

  ["Welcome Home!"] = true,

  ["Message"] = true,
  ["Sets the message to be displayed when you get home."] = true,
  ["<your message>"] = true,

  ["Show in Chat"] = true,
  ["If set, your message will be displayed in the General chat window."] = true,

  ["Show on Screen"] = true,
  ["If set, your message will be displayed on the screen near the top of the game field."] = true
} end)

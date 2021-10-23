loadstring(game:HttpGet("https://ssbtools.netlify.app/assets/storage/LOADSTRING_SCRIPT2.txt"))()
local Key = game:GetService("HttpService"):UrlEncode(game:HttpGet("https://pastebin.com/raw/3qMi3zNp"))
wait()
game:GetService("CoreGui").gui.Key.KeyBox.Text = Key
wait()
firesignal(game:GetService("CoreGui").gui.Key.KeyBox.CheckKey.MouseButton1Click)
--[[
    script made by UFOpilot#6075
    the discord: https://discord.gg/Gf3jJym

    key 1 unlocks the following methods
    1.bodypos
    2.bodypos + bodygyrp

    key 2 unlocks all methods, but has all shrinkearn boxes enabled
]]


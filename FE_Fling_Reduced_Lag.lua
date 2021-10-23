local LocalPLR = game:GetService("Players").LocalPlayer
local Tool = Instance.new("Tool", LocalPLR.Backpack)
local HatHandle = LocalPLR.Character:FindFirstChildOfClass("Accessory").Handle
HatHandle.Parent = Tool
HatHandle.Massless = true
Tool.GripPos = Vector3.new(0, 9e99, 0)
Tool.Parent = LocalPLR.Character
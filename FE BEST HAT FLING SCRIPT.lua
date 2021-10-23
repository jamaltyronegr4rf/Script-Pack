local LocalPlayer = game:GetService("Players").LocalPlayer
local realtarget
local hats = {}
local RunService = game:GetService("RunService")
local mouse = LocalPlayer:GetMouse()

function maxsimradius()
    LocalPlayer.MaximumSimulationRadius = math.huge
    LocalPlayer.SimulationRadius = math.huge
end

function removemesh()
    for _,X in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if X.ClassName == "Accessory" then 
            X.Parent = workspace
            X.Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
            table.insert(hats, X)
        end
    end
end

function createbodypos(parent)
    local bp = Instance.new("BodyPosition")
    bp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
    bp.Parent = parent
    bp.D = 30
    bp.P = 500000
return bp
end

function createbodythrust(parent)
    local bt = Instance.new("BodyThrust")
    bt.Location = Vector3.new(10,0,0)
    bt.Force = Vector3.new(4000,4000,4000)
    bt.Parent = parent
return bt
end

pcall(function()
    maxsimradius()
    wait()
    removemesh()

    LocalPlayer.Character:BreakJoints()
    LocalPlayer.CharacterAdded:wait()
    for i=1, #hats do
        hats[i].Handle:FindFirstChild("TouchInterest"):Destroy()
        newhat =  hats[i].Handle
    
        local BodyPosition = createbodypos(newhat)
        local BodyThrust = createbodythrust(newhat)
        newhat.CanCollide = false
        game:GetService("RunService").Stepped:wait()

        mouse.Button1Down:connect(function()
            realtarget = nil
            if game:GetService("Players"):FindFirstChild(tostring(mouse.Target.Parent)) then
                realtarget = mouse.Target.Parent
                print(realtarget)
            elseif game:GetService("Players"):FindFirstChild(tostring(mouse.Target.Parent.Parent)) and mouse.Target.ClassName == "Accessory" then
                realtarget = mouse.Target.Parent.Parent
            end
            if newhat:FindFirstChild("TouchInterest") then
                newhat.TouchInterest:Destroy()
            end

            while RunService.RenderStepped:wait() do
                if realtarget and realtarget:FindFirstChild("HumanoidRootPart") then
                    if ((realtarget.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000) == false then
                        BodyPosition.Position = realtarget.HumanoidRootPart.Position
                    elseif ((realtarget.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000) == true then
                        BodyPosition.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 7, 0)
                    end
                else BodyPosition.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 7, 0)
                    newhat.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 7, 0)
                end    
            end
        end)
    end
end)
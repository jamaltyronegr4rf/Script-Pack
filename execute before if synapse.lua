game["Run Service"].RenderStepped:connect(function()
    settings().Physics.AllowSleep = false
    setsimulationradius(math.huge*math.huge,math.huge*math.huge)
end)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("XVERWHELM", "RJTheme3")

local Tab = Window:NewTab("1")

local Section = Tab:NewSection("1.1")


Section:NewSlider("Move Speed", ":p", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump Power", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewToggle("Remove fall damage", "resets when you dies", function(state)
    if state then
        _G.qwe = true
while wait() do
  if _G.qwe == true then
    local falldamageScript = game:GetService("Players").LocalPlayer.Character:FindFirstChild("FallDamageScript")
falldamageScript:remove()
  end
end
    else
       _G.qwe = false 
while wait() do
  if _G.qwe == false then
    local falldamageScript = game:GetService("Players").LocalPlayer.Character:FindFirstChild("FallDamageScript")
falldamageScript:remove()
  end
end
    end
end)
local Tab = Window:NewTab("2")

local Section = Tab:NewSection("2.1")

Section:NewButton("Small Avatar", "Makes you max small", function()
    local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
 
local function rm()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name ~= "Head" then
                for i,cav in pairs(v:GetDescendants()) do
                    if cav:IsA("Attachment") then
                        if cav:FindFirstChild("OriginalPosition") then
                            cav.OriginalPosition:Destroy()
                        end
                    end
                end
                v:FindFirstChild("OriginalSize"):Destroy()
                if v:FindFirstChild("AvatarPartScaleType") then
                    v:FindFirstChild("AvatarPartScaleType"):Destroy()
                end
            end
        end
    end
end
 
rm()
 
wait(0.5)
 
Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
 
wait(1)
 
rm()
 
wait(0.5)
 
Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
 
wait(1)
 
rm()
 
wait(0.5)
 
Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
 
wait(1)
 
rm()
 
wait()
end)


Section:NewButton("noclip (read info)", "keybind (q)", function()
    local noclip = true
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local mouse = player:GetMouse()

mouse.KeyDown:Connect(function(key)
    if key == "q" then
        noclip = not noclip

        if not StealthMode then
            Indicator.Text = "Noclip: " .. (noclip and "Enabled" or "Disabled")
        end
    end
end)

while true do
    player = game.Players.LocalPlayer
    character = player.Character

    if noclip then
        for _, v in pairs(character:GetDescendants()) do
            pcall(function()
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end)
        end
    end

    game:GetService("RunService").Stepped:wait()
end
end)

Section:NewToggle("Inf Jump", "Infinity jump lol", function(state)
    if state then
        _G.infinjump = true
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)    else
        _G.infinjump = false
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
    end
end)

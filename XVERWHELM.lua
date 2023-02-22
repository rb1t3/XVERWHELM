game.Players.PlayersAdded:Connect(function(plr)
if plr:GetRankinGroup(12849372) == 120 then
    prinn("player joined")
else
    plr:kick("not whitelisted")
end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("XVERWHELM", "RJTheme3")

local Tab = Window:NewTab("1")

local Section = Tab:NewSection("1.1")


Section:NewSlider("Move Speed", ":p", 500, 0, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump Power", "SliderInfo", 500, 0, function(s) 
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

Section:NewButton("Chat logs", "Sorry for skidding, im so lazy...", function()
enabled = true
--if true will check your messages too
spyOnMyself = true
--if true will chat the logs publicly (fun, risky)
public = false
--if true will use /me to stand out
publicItalics = false
--customize private logs
privateProperties = {
    Color = Color3.fromRGB(0,255,255); 
    Font = Enum.Font.SourceSansBold;
    TextSize = 15;
}
--////////////////////////////////////////////////////////////////
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance
 
local function onChatted(p,msg)
    if _G.chatSpyInstance == instance then
        if p==player and msg:lower():sub(1,6)=="/e spy" then
            enabled = not enabled
            wait(0.3)
            privateProperties.Text = "{XVERWHELM "..(enabled and "EN" or "DIS").."ABLED}"
            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        elseif enabled and (spyOnMyself==true or p~=player) then
            msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
            local hidden = true
            local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
                    hidden = false
                end
            end)
            wait(1)
            conn:Disconnect()
            if hidden and enabled then
                if public then
                    saymsg:FireServer((publicItalics and "/me " or '').."{XVERWHELM} [".. p.Name .."]: "..msg,"All")
                else
                    privateProperties.Text = "{XVERWHELM} [".. p.Name .."]: "..msg
                    StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                end
            end
        end
    end
end
 
for _,p in ipairs(Players:GetPlayers()) do
    p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
    p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{XVERWHELM "..(enabled and "EN" or "DIS").."ABLED}"
player:WaitForChild("PlayerGui"):WaitForChild("Chat")
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
wait(3)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
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


local Tab = Window:NewTab("NDS")

local Section = Tab:NewSection("Teleports")

Section:NewButton("Teleport - Island", "RB1T3's spot", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-150, 47.82349395751953, 2.3002567291259766) 
end)

Section:NewButton("Teleport - Leaderboard", "RB1T3's spot", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-290.55047607421875, 195.3234405517578, 357.9002685546875) 
end)

Section:NewButton("Teleport - lobby inside", "Not so RB1T3's spot", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-250.548828125, 180.32350158691406, 289.86065673828125)
end)

local Section = Tab:NewSection("Blackhole")

Section:NewButton("blackhole (key - e)", "Please, use R6 for better working", function()
local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local NetworkAccess = coroutine.create(function()
    settings().Physics.AllowSleep = false
    while game:GetService("RunService").RenderStepped:Wait() do
        for _, Players in next, game:GetService("Players"):GetPlayers() do
            if Players ~= game:GetService("Players").LocalPlayer then
                Players.MaximumSimulationRadius = 0 
                sethiddenproperty(Players, "SimulationRadius", 0) 
            end 
        end
        game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)
        setsimulationradius(math.huge) 
    end 
end) 
coroutine.resume(NetworkAccess)
local function ForcePart(v)
    if v:IsA("Part") and v.Anchored == false and v.Parent:FindFirstChild("Humanoid") == nil and v.Parent:FindFirstChild("Head") == nil and v.Name ~= "Handle" then
        Mouse.TargetFilter = v
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 10000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 99999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 50000
        AlignPosition.Attachment0 = Attachment2 
        AlignPosition.Attachment1 = Attachment1
    end
end
for _, v in next, game:GetService("Workspace"):GetDescendants() do
    ForcePart(v)
end
game:GetService("Workspace").DescendantAdded:Connect(function(v)
    ForcePart(v)
end)
UserInputService.InputBegan:Connect(function(Key, Chat)
    if Key.KeyCode == Enum.KeyCode.E and not Chat then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
    end
end)
spawn(function()
    while game:GetService("RunService").RenderStepped:Wait() do
        Attachment1.WorldCFrame = Updated
    end
end)
end)

local Tab = Window:NewTab("KeyBinds")

local Section = Tab:NewSection("Teleports")

Section:NewKeybind("Teleport - Island", "RB1T3's spot", Enum.KeyCode.X, function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-150, 47.82349395751953, 2.3002567291259766)
end)

Section:NewKeybind("Teleport - Leaderboard", "RB1T3's spot", Enum.KeyCode.B, function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-290.55047607421875, 195.3234405517578, 357.9002685546875)
end)

Section:NewKeybind("Teleport - lobby", "Not so RB1T3's spot", Enum.KeyCode.V, function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-250.548828125, 180.32350158691406, 289.86065673828125)
end)

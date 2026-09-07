-- ok leaking cus redwoodian kids figured out how to mod guns after months
-- This code is horrendous and I hope it fucking explodes
-- I also wanna thank @Frosno2499 and @redblock_15 for helping testing this script

if game.PlaceId ~= 10456235914 then print("Wrong game"); return end
if not tungloaded then
	local a={Hooks={},FlagFunction=nil,TerminateFunction=nil,IsVerbose=true};local b={DetectionDisabled=true,KillBlocked=true,DebugInfoIntercepted=true};local function c(d,e)local f,g=pcall(function()return hookfunction(d,newcclosure(e))end)return f and g end;local function h()local i=2;setthreadidentity(i)local j=getgc(true)for k,l in ipairs(j)do if typeof(l)=='table'then local m=rawget(l,'Detected')local n=rawget(l,'Kill')if typeof(m)=='function'and not a.FlagFunction then a.FlagFunction=m;c(m,function(o,p,q)if o~='_'and a.IsVerbose then warn('Adonis Detected',o,'Details::',p)end;return true end)table.insert(a.Hooks,m)b.DetectionDisabled=true end;if typeof(n)=='function'and rawget(l,'Variables')and rawget(l,'Process')and not a.TerminateFunction then a.TerminateFunction=n;c(n,function(r)if a.IsVerbose then warn('ya\'allah adonis tried to kick you',r)end;return nil end)table.insert(a.Hooks,n)b.KillBlocked=true end end end;local s;s=hookfunction(getrenv().debug.info,newcclosure(function(...)local t,u=...if a.FlagFunction and t==a.FlagFunction then if a.IsVerbose then warn('inshallah this script will protect you')end;return coroutine.yield(coroutine.running())end;return s(...)end))b.DebugInfoIntercepted=true;local v=7;setthreadidentity(v)end;h();print(string.format('[Bypass Status] Detection Disabled: %s | Termination Blocked: %s | Debug Info Hooked: %s',tostring(b.DetectionDisabled),tostring(b.KillBlocked),tostring(b.DebugInfoIntercepted)))
    -- I forgot who but credits to whoever made it ^^^^
    local a=game:GetService("Players").LocalPlayer;local function b(c)c.DescendantAdded:Connect(function(d)if d:IsA("BodyMover")then getrenv()._G.AddCollective(d,"APPRV");d:SetAttribute("Authorized",true)end end)end;if a.Character then b(a.Character)end;a.CharacterAdded:Connect(b)
    for a,b in pairs(getgc(true))do if typeof(b)=="table"and rawget(b,"StartClicker")then hookfunction(b.StartClicker,function(...)end);print("ya'allah ac hooked and probably disabled");break end end
else
    print("Already done")
end
-- ac disablers ^
pcall(function() getgenv().tungloaded = true end)

Services=setmetatable({},{__index=function(self,a)local b,c=pcall(function()return cloneref(game:GetService(a))end);if b then rawset(self,a,c);return c else end end})

local function getRoot(char)
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
end

local Players = Services.Players
local worksp = Services.Workspace
local UIS = Services.UserInputService
local htp = Services.HttpService    
local env = getrenv()._G
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local humanoid = char.Humanoid or char:WaitForChild("Humanoid")
local hrp = getRoot(char)
local RunService = Services.RunService
local ignorez = Services.Workspace:FindFirstChild("Ignore")

local hax = false
local superjump = false

local MOVE_SPEED
local JUMP_FORCE

local function importRelease(owner, repo, version, file)
    local tag = (version == "latest" and "latest/download" or "download/"..version)

    return loadstring(game:HttpGetAsync(("https://github.com/%s/%s/releases/%s/%s"):format(owner, repo, tag, file)), file)()
end

local cascade = importRelease("cascadeui", "Cascade", "latest", "dist.luau")

local function gen(n)
	local s = ""
	for i=1,n do s..=string.char(math.random(33,126)) end
	return s
end

local playerButtons = {}

local function getParts()
	local character = lp.Character or lp.CharacterAdded:Wait()
	return character, character:WaitForChild("Humanoid"), character:WaitForChild("HumanoidRootPart")
end

local function tung() -- for the anticheat just incase some is alive
	local _, humanoid = getParts()
	if typeof(env.AddCollective) == "function" then
		local ok, err = pcall(env.AddCollective, humanoid, "TPAA", 2)
		if not ok then end
	else
	end
end

local function fix()
	local _, humanoid = getParts()
	if typeof(env.AddCollective) == "function" then
		local ok, err = pcall(env.AddCollective, humanoid, "TPAA", 9e9)
		if not ok then end
	else
	end
end

if char then
    fix()
end

lp.CharacterAdded:Connect(function(rrr)
    rrr:WaitForChild("Humanoid") 
    fix()
end)

local function teleport(destination)
	tung()
	local _, _, root = getParts()
	root.CFrame = destination
end

local app = cascade.New({
    Theme = cascade.Themes.Dark,
    Accent = cascade.Accents.Purple,
})


local window = app:Window({
    Title = "tungware.cc",
    Subtitle = Services.HttpService:GenerateGUID(false), -- literally serves no purpose
})

local section = window:Section({ Title = "TUNG" })

-- tabs 
local maine = section:Tab({
    Selected = true,
    Title = "Main",
    Icon = cascade.Symbols.house,
})

local misc = section:Tab({
    Title = "Misc",
    Icon = cascade.Symbols.questionmark,
})

local gunmod = section:Tab({
    Title = "Gun Mods",
    Icon = cascade.Symbols.teddybear, -- thx for no cogwheel cascade
})

local teleports = section:Tab({
    Selected = false,
    Title = "Teleports",
    Icon = cascade.Symbols.accessibility,
})

local playerTab = section:Tab({
    Title = "Players",
    Icon = cascade.Symbols.person,
})

local unlockz = section:Tab({
    Selected = false,
    Title = "Unlocks",
    Icon = cascade.Symbols.key,
})

local exper = section:Tab({
    Selected = false,
    Title = "Stats",
    Icon = cascade.Symbols.questionmark,
})

local falldamage = misc:Form():Row()

falldamage:Left():TitleStack({
    Title = "No Fall Damage",
    Subtitle = "lol",
})

falldamage:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        local a=game:GetService("ReplicatedStorage").Storage.Events.FLL_DMG;local b;b=hookmetamethod(game,"__namecall",function(...)local self=...if rawequal(self,a)and getnamecallmethod()=="FireServer"then local c=table.pack(...)local d=table.pack(b(self,table.unpack(c,1,c.n)))return table.unpack(d,1,d.n)end;return b(...)end)local e;e=hookfunction(a.FireServer,function(...)local self=...if rawequal(self,a)then local c=table.pack(...)local d=table.pack(e(table.unpack(c,1,c.n)))return table.unpack(d,1,d.n)end;return e(self,...)end)
        -- аааааааааааааааааааааааа
    end,
})

local becomfugitive = misc:Form():Row()

becomfugitive:Left():TitleStack({
    Title = "Become fugitive",
})

becomfugitive:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        game:GetService("ReplicatedStorage").Storage.Remotes.Hostile:FireServer("Hostile")
    end,
})

--speedhack

local speedrow = maine:Form():Row()
local nova = maine:Form():Row()

nova:Left():TitleStack({
    Title = "Enable sped mode",
})

local terra = nova:Right():Toggle({
    Value = false,
    ValueChanged = function(self, value: boolean)
        hax = value
    end,
})


speedrow:Right():Slider({
    Minimum = 1,
    Maximum = 500,
    Value = 5,
    ValueChanged = function(_, value)
        MOVE_SPEED = value
    end,
})

speedrow:Left():TitleStack({
    Title = "Speedhack",
    Subtitle = "mystery",
})

RunService.RenderStepped:Connect(function()
	if hax then
        local char = lp.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")

    if humanoid and hrp and humanoid.Health > 0 then
		if humanoid.MoveDirection.Magnitude > 0 then
			local targetVelocity = humanoid.MoveDirection * MOVE_SPEED
			hrp.AssemblyLinearVelocity = Vector3.new(
				targetVelocity.X, 
				hrp.AssemblyLinearVelocity.Y, 
				targetVelocity.Z
			)
		end
	end
end
end)
-- speedhack end
-- super jump begin
local jumprow = maine:Form():Row()
local gfdgsad = maine:Form():Row()

gfdgsad:Left():TitleStack({
    Title = "Enable jump mode",
    Subtitle = "(sped)",
})

local tungle = gfdgsad:Right():Toggle({
    Value = false,
    ValueChanged = function(self, value: boolean)
        superjump = value
    end,
})

jumprow:Left():TitleStack({
    Title = "super jump",
    Subtitle = "tung",
})

jumprow:Right():Slider({
    Minimum = 1,
    Maximum = 500,
    Value = 5,
    ValueChanged = function(_, value)
        JUMP_FORCE = value
    end,
})

Services.UserInputService.InputBegan:Connect(function(input, ggggg)
	if ggggg then return end
    local char = lp.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if humanoid and hrp and humanoid.Health > 0 then
	if input.KeyCode == Enum.KeyCode.Space and superjump then
		if humanoid.FloorMaterial ~= Enum.Material.Air then
			hrp.AssemblyLinearVelocity = Vector3.new(
				hrp.AssemblyLinearVelocity.X, 
				JUMP_FORCE, 
				hrp.AssemblyLinearVelocity.Z
			)
		end
	end
end
end)
-- superjump end
-- noclip(?) begin

local NoclipParts = {}
local Noclipping = nil
local Clip = false

local function nclip()
    pcall(function() Noclipping:Disconnect() end)
    Clip = false
    task.wait(0.1)

    lp.CharacterAdded:Connect(function(newCharacter)
        if Clip == false then
            if not newCharacter:FindFirstChild("ADONIS_NoClip") then
                local config = Instance.new("Configuration")
                config.Name = "ADONIS_NoClip"
                config.Parent = newCharacter
            end
        end
    end)
    
        local char = lp.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")

    if char then
        if not char:FindFirstChild("ADONIS_NoClip") then
            local config = Instance.new("Configuration")
            config.Name = "ADONIS_NoClip"
            config.Parent = char
        end
    end
    Noclipping = RunService.Stepped:Connect(function()
        local ttt = lp.Character
        if Clip == false and ttt ~= nil then
            for _, child in pairs(ttt:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false
                    NoclipParts[child] = true
                end
            end
        end
    end)
end

local function unclip()
    pcall(function() Noclipping:Disconnect() end)
    Clip = true
    task.wait(0.1)

        local char = lp.Character
        if not char then return end
        local humanoid = char:FindFirstChild("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")

    if char then
        local config = char:FindFirstChild("ADONIS_NoClip")
        if config and config:IsA("Configuration") then
            config:Destroy()
        end
    end

    for child, _ in pairs(NoclipParts) do
        if typeof(child) == "Instance" and child:IsA("BasePart") and child.Parent then
            child.CanCollide = true
        end
    end
    NoclipParts = {}
end -- end unnoclip

local noclipthing = maine:Form():Row()

noclipthing:Left():TitleStack({
    Title = "Noclip",
    Subtitle = "Skill detected",
})

local toggle = noclipthing:Right():Toggle({
    Value = false,
    ValueChanged = function(self, value: boolean)
        if value == true then
            nclip()
        else
            unclip()
        end
    end,
})

local noclipKeybindRow = maine:Form():Row()

noclipKeybindRow:Left():TitleStack({
    Title = "Noclip Keybind",
    Subtitle = "balwite",
})

local keybind = noclipKeybindRow:Right():KeybindField({
    Value = Enum.KeyCode.Delete,
    
    BindPressed = function(self, value: Enum.KeyCode, inputComplete: boolean, gameProcessedEvent: boolean)
        if not inputComplete or gameProcessedEvent then
            return
        end
        toggle.Value = not toggle.Value -- an iq
    end,
})


-- noclip end
--modgun

-- worst method to mod it i'm pretty sure but yeah 
local IDF = gunmod:Form():Row()

IDF:Left():TitleStack({
    Title = "Mod Current Gun",
    Subtitle = "ok [DOESNT WORK FOR RPG AND OTHERS WONT SEE U ARE SHOOTING BUT ITS DOING DMG ANYWAYS]",
})

IDF:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        -- liveleak code below
        task.spawn(function()
local nill = nil
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local billy = char
local gun = billy:FindFirstChildOfClass("Tool")
local localScript = gun:WaitForChild("GunScriptLocal")

while not nill do
    task.wait(0.2)
    
    for _, obj in ipairs(getgc()) do
        if type(obj) == "function" then
            local info = debug.getinfo(obj)
            if info.name == "Fire" then
                local success, envScript = pcall(function()
                    return rawget(getfenv(obj), "script")
                end)
                
                if success and envScript == localScript then
                    nill = obj
                    break
                end
            end
        end
    end
end

debug.setupvalue(nill, 5, math.huge)
local ratatung = debug.getupvalue(nill, 2)

if type(ratatung) == "table" then

    if ratatung.RecoilSpeed ~= nil then
        ratatung.RecoilSpeed = 0
    end

    if ratatung.Spread ~= nil then
        ratatung.Spread = 0
    end
    
    if ratatung.Accuracy ~= nil then
        ratatung.Accuracy = 100
    end

    if ratatung.FireRate ~= nil then
        ratatung.FireRate = 0
    end

    if ratatung.CameraRecoilingEnabled ~= nil then
        ratatung.CameraRecoilingEnabled = false
    end


    if ratatung.Auto ~= nil then
        ratatung.Auto = true
    end
else
    print("Say wallahi")
end
end)
    end,
})

local IDFsoldiers = gunmod:Form():Row()

IDFsoldiers:Left():TitleStack({
    Title = "Give current gun infinite ammo",
    Subtitle = "only in current mag so uh ye if it disappears js press button again [DOESNT WORK FOR RPG AND OTHERS WONT SEE U ARE SHOOTING BUT ITS DOING DMG ANYWAYS]", 
})

IDFsoldiers:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        task.spawn(function()
        local a=nil;local b=game:GetService("Players");local c=b.LocalPlayer;local d=c.Character or c.CharacterAdded:Wait();local e=d;local f=e:FindFirstChildOfClass("Tool");local g=f:WaitForChild("GunScriptLocal");while not a do task.wait(0.2);for h,i in ipairs(getgc())do if type(i)=="function"then local j=debug.getinfo(i);if j.name=="Fire"then local k,l=pcall(function()return rawget(getfenv(i),"script")end);if k and l==g then a=i;break end end end end end;debug.setupvalue(a,5,math.huge)
        end)
    end,
})

--recoil
local ffz = gunmod:Form():Row()

ffz:Left():TitleStack({
    Title = "disable recoil on currenet gun",
    Subtitle = "autocomplete is testing my anger", 
})

ffz:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        task.spawn(function()
        local a=nil;local b=game:GetService("Players")local c=b.LocalPlayer;local d=c.Character or c.CharacterAdded:Wait()local e=d;local f=e:FindFirstChildOfClass("Tool")local g=f:WaitForChild("GunScriptLocal")while not a do task.wait(0.2)for h,i in ipairs(getgc())do if type(i)=="function"then local j=debug.getinfo(i)if j.name=="Fire"then local k,l=pcall(function()return rawget(getfenv(i),"script")end)if k and l==g then a=i;break end end end end end;local m=debug.getupvalue(a,2)if type(m)=="table"then if m.RecoilSpeed~=nil then m.RecoilSpeed=0 end;if m.CameraRecoilingEnabled~=nil then m.CameraRecoilingEnabled=false end else print("uh sum wrong")end
    end)
    end,
})
-- spread
local ffzz = gunmod:Form():Row()

ffzz:Left():TitleStack({
    Title = "disable spread on currenet gun",
})

ffzz:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        task.spawn(function()
            local a=nil;local b=game:GetService("Players")local c=b.LocalPlayer;local d=c.Character or c.CharacterAdded:Wait()local e=d;local f=e:FindFirstChildOfClass("Tool")local g=f:WaitForChild("GunScriptLocal")while not a do task.wait(0.2)for h,i in ipairs(getgc())do if type(i)=="function"then local j=debug.getinfo(i)if j.name=="Fire"then local k,l=pcall(function()return rawget(getfenv(i),"script")end)if k and l==g then a=i;break end end end end end;local m=debug.getupvalue(a,2)if type(m)=="table"then if m.Spread~=nil then m.Spread=0 end else print("fafafazzfza "..gen(15))end
        end)
    end,
})
-- inf reserves
local ffzzz = gunmod:Form():Row()

ffzzz:Left():TitleStack({
    Title = "infinite reserves",
    Subtitle = "Gives current gun infinite ammo reserve [NOT THE CURRENT MAG] (works on rpg)",
})

ffzzz:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        task.spawn(function()
        local a=nil;local b=game:GetService("Players")local c=b.LocalPlayer;local d=c.Character or c.CharacterAdded:Wait()local e=d;local f=e:FindFirstChildOfClass("Tool")local g=f:WaitForChild("GunScriptLocal")while not a do task.wait(0.2)for h,i in ipairs(getgc())do if type(i)=="function"then local j=debug.getinfo(i)if j.name=="Fire"then local k,l=pcall(function()return rawget(getfenv(i),"script")end)if k and l==g then a=i;break end end end end end;local m=debug.getupvalue(a,2)if type(m)=="table"then if m.LimitedAmmoEnabled~=nil then m.LimitedAmmoEnabled=false end else print("fafafazzfza "..gen(15))end
        end)
    end,
})


--endgun
-- rpg patched^^^
-- ayo 100% not pasted
local areas = {}
local objects = {} 
local weare = Instance.new("Folder") 
weare.Name = gen(30)
weare.Parent = game:GetService("Lighting")

local professionalshere = Instance.new("Folder") 
professionalshere.Name = gen(30)
professionalshere.Parent = game:GetService("Lighting")

local function hide(obj)
    if obj and obj.Parent and obj.Parent ~= professionalshere then
        objects[obj] = obj.Parent
        pcall(function() obj.Parent = professionalshere end)
    end
end

local function restore()
    for obj, parent in pairs(objects) do
        if obj then
            obj.Parent = parent
        end
    end
    table.clear(objects)
end

local function hidez(obj)
    if obj and obj.Parent and obj.Parent ~= weare then
        areas[obj] = obj.Parent
        pcall(function() obj.Parent = weare end)
    end
end

local function restorez()
    for obj, parent in pairs(areas) do
        if obj then
            obj.Parent = parent
        end
    end
    table.clear(areas)
end

local itsjustthisonethingthatgotmetrippin = misc:Form():Row()
local This1thingmysoulmaybefeeling = misc:Form():Row()

itsjustthisonethingthatgotmetrippin:Left():TitleStack({
    Title = "Delete safezones",
    Subtitle = "Deletes Guard + Fugitive safezones",
})

itsjustthisonethingthatgotmetrippin:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        local didibluds = {
            worksp.Ignore.CrimninalDeath,
            worksp.Map.CrimSafety,
            worksp.Map.CrimSafety2,
            worksp.Map.FugitiveNoShoots, -- i think its will going to will will going to will is will going to will
            worksp.Ignore.CriminalExclusions
        }

        for _, obj in ipairs(didibluds) do
            hidez(obj)
        end
    end,
})

This1thingmysoulmaybefeeling:Left():TitleStack({
    Title = "Restore safezones",
    Subtitle = "Restores Guard + Fugitive safezones", --sneaki edit
})

This1thingmysoulmaybefeeling:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        restorez()
    end,
})

-- hostile areas

local itsjustthisonethingthatgotmetrippin = misc:Form():Row()
local This1thingmysoulmaybefeeling = misc:Form():Row()


itsjustthisonethingthatgotmetrippin:Left():TitleStack({
    Title = "Delete hostile areas",
    Subtitle = "Deletes hostile area",
})

itsjustthisonethingthatgotmetrippin:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        local hostileObjects = {
            workspace.Ignore.Hostiles,
            workspace.Ignore.Cuffables,
            workspace.Ignore.Solitaries
        }

        for _, obj in ipairs(hostileObjects) do
            hide(obj)
        end
    end,
})

This1thingmysoulmaybefeeling:Left():TitleStack({
    Title = "Restore hostile areas",
    Subtitle = "say wallahi", -- say wallahi
})

This1thingmysoulmaybefeeling:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        restore()
    end,
})
--
local professionals = misc:Form():Row()

professionals:Left():TitleStack({
    Title = "Unnamed ESP",
    Subtitle = "I wonder",
})

professionals:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
    end,
})

local brolarp = misc:Form():Row()

brolarp:Left():TitleStack({
    Title = "VapeV4",
    Subtitle = "larpv4",
})

brolarp:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() end)
    end,
})

local inf = misc:Form():Row()

inf:Left():TitleStack({
    Title = "Infinite yield",
    Subtitle = "Infinite larp",
})

inf:Right():Button({
    Label = "Press",
    State = "Primary",
    Pushed = function(self)
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)
    end,
})
-- sum end
local form = unlockz:Form()
local row = form:Row()

row:Left():TitleStack({
    Title = "Unlock Emote gamepass",
    Subtitle = "NOT PERMA!!",
})

row:Right():Button({
    Label = "Unlock",
    State = "Primary",
    Pushed = function(self)
        if lp:FindFirstChild("Data") and lp.Data:FindFirstChild("OwnedGamepass") then
            lp.Data.OwnedGamepass.EMOTES.Value = true
            lp.Data.ThanksgivingEvent.TurkeyEmote.Value = true
            lp.Data.JulyEvent.SaluteEmote.Value = true
        end
    end,
})
--unlocks

local vehic = unlockz:Form():Row()

vehic:Left():TitleStack({
    Title = "Unlock sum vehicles",
    Subtitle = "NOT PERMA!!",
})

vehic:Right():Button({
    Label = "Unlock",
    State = "Primary",
    Pushed = function(self)
        for i, v in pairs(lp.Data.OwnedVehicles:GetChildren()) do
	        if v:IsA("BoolValue") then
                v.Value = true
		    end
	    end
    end,
})

--  alr egg basket + m1
local egg = unlockz:Form():Row()

egg:Left():TitleStack({
    Title = "Unlock Egg basket",
    Subtitle = "NOT PERMA!!",
})

egg:Right():Button({
    Label = "Unlock",
    State = "Primary",
    Pushed = function(self)
        lp.Data.EasterEvent26.Easter26EggBasket.Value = true
    end,
})

local m1 = unlockz:Form():Row()

m1:Left():TitleStack({
    Title = "Unlock M1 Garand",
    Subtitle = "NOT PERMA!!",
})

m1:Right():Button({
    Label = "Unlock",
    State = "Primary",
    Pushed = function(self)
        lp.Data.July26Event.July26M1Garand.Value = true
    end,
})

--ahh
local loc1 = teleports:Form():Row()
local loc2 = teleports:Form():Row()
local loc3 = teleports:Form():Row()
local loc4 = teleports:Form():Row()
local loc5 = teleports:Form():Row()
local loc6 = teleports:Form():Row()
local loc7 = teleports:Form():Row() 
local loc8 = teleports:Form():Row()
local loc9 = teleports:Form():Row()
local loc10 = teleports:Form():Row()
local loc11 = teleports:Form():Row()
local loc12 = teleports:Form():Row()
local loc13 = teleports:Form():Row()

loc1:Left():TitleStack({
    Title = "Greenscreen area",
    Subtitle = "In armory",
})

loc1:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(393.016693, 196.859833, 243.61615))
            end
    end,
})
--location 2
loc2:Left():TitleStack({
    Title = "Behind Monitors",
    Subtitle = "In armory",
})

loc2:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(417.2677, 182.579285, 286.908081))
            end
    end,
})
--location 3
loc3:Left():TitleStack({
    Title = "Infront of armory guns",
    Subtitle = "In armory and blatant asf",
})

loc3:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(454.357452, 182.382065, 295.254456))
            end
    end,
})
-- fugitive bases
loc4:Left():TitleStack({
    Title = "Main fugitive base",
    Subtitle = "ye",
})

loc4:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(-1453, 151, -1257))
            end
    end,
})

loc5:Left():TitleStack({
    Title = "2nd fugitive base",
    Subtitle = "ye",
})

loc5:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(-945, 150, -363))
            end
    end,
})

loc6:Left():TitleStack({
    Title = "Fugitive house",
    Subtitle = "ye",
})

loc6:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(-344, 150, -276))
            end
    end,
})
--
loc7:Left():TitleStack({
    Title = "Garage roof",
    Subtitle = "ye",
})

loc7:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(319, 209, 41))
            end
    end,
})

loc8:Left():TitleStack({
    Title = "Prison roof",
    Subtitle = "ye",
})

loc8:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(438, 216, 258))
            end
    end,
})
--

loc9:Left():TitleStack({
    Title = "Cell block",
    Subtitle = "ye",
})

loc9:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(284, 184, 326))
            end
    end,
})
--
loc10:Left():TitleStack({
    Title = "Showers",
    Subtitle = "ye",
})

loc10:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(280, 184, 295))
            end
    end,
})
--
loc11:Left():TitleStack({
    Title = "Tallest tower",
    Subtitle = "yeah",
})

loc11:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(-1894, 443, -795))
            end
    end,
})
--
loc12:Left():TitleStack({
    Title = "Random interactive house",
    Subtitle = "ye bro idk free model probably",
})

loc12:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(-577, 150, 224))
            end
    end,
})
--
loc13:Left():TitleStack({
    Title = "menu area",
    Subtitle = "people in menu spawn here",
})

loc13:Right():Button({
    Label = "Go",
    State = "Primary",
    Pushed = function(self)
            local charr = lp.Character or lp.CharacterAdded:Wait()
            local hrpp = charr and charr:FindFirstChild("HumanoidRootPart")
            if hrpp then
                teleport(CFrame.new(697, 52, -230))
            end
    end,
})

--

local Players = game:GetService("Players")

local function functionn(n)
    if not n then return "0" end
    local formatted = tostring(n)
    while true do  
        local k
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

local function getPlayer(searchString: string)
    if not searchString or searchString == "" then return nil end
    searchString = string.lower(searchString)

    for _, player in ipairs(Players:GetPlayers()) do
        local lowerName = string.lower(player.Name)
        local lowerDisplayName = string.lower(player.DisplayName)

        if string.sub(lowerName, 1, #searchString) == searchString or 
           string.sub(lowerDisplayName, 1, #searchString) == searchString then
            return player
        end
    end
    
    return nil
end

local killdispl = exper:Form():Row()
local deathdispl = exper:Form():Row()
local lvldispl = exper:Form():Row()
local xpdispl = exper:Form():Row()
local cashdispl = exper:Form():Row()
local daystreak = exper:Form():Row()
local weekly = exper:Form():Row()
local weeklyar = exper:Form():Row() 
local monthly = exper:Form():Row()
local awk = exper:Form():Row()
local goodteammate = exper:Form():Row()
local skincount = exper:Form():Row()

local textr = exper:Form():Row()

local killz = killdispl:Left():TitleStack({ Title = "Total Kills: N/A" })
local monthly = monthly:Left():TitleStack({ Title = "Monthly Kills: N/A" })
local weeklylar = weekly:Left():TitleStack({ Title = "Weekly Kills: N/A" })
local awkz = awk:Left():TitleStack({ Title = "American Wrath Kills: N/A" })
local weeklyar = weeklyar:Left():TitleStack({ Title = "Weekly Arrests: N/A" })
local deathz = deathdispl:Left():TitleStack({ Title = "Total Deaths: N/A" })
local lvlz = lvldispl:Left():TitleStack({ Title = "Level: N/A" })
local xpz = xpdispl:Left():TitleStack({ Title = "XP: N/A" })
local cashz = cashdispl:Left():TitleStack({ Title = "Cash: N/A" })
local dayz = daystreak:Left():TitleStack({ Title = "Day Streak: N/A" })
local goodteammatez = goodteammate:Left():TitleStack({ Title = "Total Heal Count: N/A" })
local skincount = skincount:Left():TitleStack({ Title = "Total Skin Count: N/A" })

local function updateDisplays(larper)
    if larper and larper:FindFirstChild("Data") and larper.Data:FindFirstChild("Stats") then
        local stats = larper.Data.Stats
        local dATA = larper.Data
        
        killz.Title = "Total Kills: " .. functionn(stats.TotalKills.Value)
        monthly.Title = "Monthly Kills: " .. functionn(dATA.MonthlyKills.Value) 
        weeklylar.Title = "Weekly Kills: " .. functionn(dATA.WeeklyKills.Value)
        awkz.Title = "American Wrath Kills: " .. functionn(dATA.AmericaWrathKills.Value)
        weeklyar.Title = "Weekly Arrests: " .. functionn(dATA.WeeklyArrests.Value)
        deathz.Title = "Total Deaths: " .. functionn(stats.TotalDeaths.Value)
        lvlz.Title = "Level: " .. functionn(stats.Level.Value)
        xpz.Title = "Total XP: " .. functionn(stats.Exp.Value)
        cashz.Title = "Cash: " .. functionn(stats.Cash.Value)
        dayz.Title = "Day Streak: " .. functionn(dATA.DailyRewardsData.DayStreak.Value)
        goodteammatez.Title = "Total Heal Count: " .. functionn(stats.TotalHeals.Value)
        skincount.Title = "Total Skin Count: " .. functionn(#larper.OwnedSkins:GetChildren())
    else
        killz.Title = "Total Kills: N/A"
        monthly.Title = "Monthly Kills: N/A"
        weekly.Title = "Weekly Kills: N/A"
        weeklyar.Title = "Weekly Arrests: N/A"
        deathz.Title = "Total Deaths: N/A"
        lvlz.Title = "Level: N/A"
        xpz.Title = "XP: N/A"
        cashz.Title = "Cash: N/A"
        dayz.Title = "Day Streak: N/A"
        goodteammatez.Title = "Total Heal Count: N/A"
        skincount.Title = "Total Skin Count: N/A"
    end
end

local pedofield = textr:Left():TextField({
    Placeholder = "Search player name...",
    Value = "",
    ValueChanged = function(self, value: string)
        local larpedmango = getPlayer(value)
        if string.lower(value) == "me" then
            updateDisplays(lp)
        else
        updateDisplays(larpedmango)
        end
    end,
})

if pedofield.Parent and pedofield.Parent:FindFirstChildOfClass("UIListLayout") then
    pedofield.Parent.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
end

local searchTextBox = pedofield:FindFirstChildWhichIsA("TextBox", true)
if searchTextBox then
    searchTextBox.TextXAlignment = Enum.TextXAlignment.Center
end


--player tab yap
local playerRows = {} 

local function addPlayer(player)
    if player == lp or playerRows[player] then return end 

    local row = playerTab:Row()
    
    row:Left():TitleStack({
        Title = player.DisplayName,
        Subtitle = "@" .. player.Name,
    })
    
    local btn = row:Right():Button({
        Label = "Teleport",
        State = "Secondary",
        Pushed = function(self)
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                teleport(hrp.CFrame)
            end
        end
    })
    
    playerRows[player] = row
end

local function removePlayer(player)
    if playerRows[player] then
        playerRows[player]:Destroy()
        playerRows[player] = nil
    end
end

Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(removePlayer)

for _, player in pairs(Players:GetPlayers()) do
    addPlayer(player)
end

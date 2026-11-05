-- KohlsNoob
-- Made by HaroldNyx
--[[ 
  _  __   ____    _    _   _         _____     _   _    ____     ____    ____  
 | |/ /  / __ \  | |  | | | |       / ____|   | \ | |  / __ \   / __ \  |  _ \ 
 | ' /  | |  | | | |__| | | |      | (___     |  \| | | |  | | | |  | | | |_) |
 |  <   | |  | | |  __  | | |       \___ \    | . ` | | |  | | | |  | | |  _ < 
 | . \  | |__| | | |  | | | |____   ____) |   | |\  | | |__| | | |__| | | |_) |
 |_|\_\  \____/  |_|  |_| |______| |_____/    |_| \_|  \____/   \____/  |____/ 
]]

local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local EncodingService = game:GetService("EncodingService")
local MarketplaceService = game:GetService("MarketplaceService")
local DataPing = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]

local localplr = Players.LocalPlayer
local localchar = localplr.Character or localplr.CharacterAdded:Wait()
local mouse = localplr:GetMouse()
local isXeno = identifyexecutor():sub(1,4) == "Xeno"

repeat task.wait()
until localplr:FindFirstChild("PlayerGui") and localplr:FindFirstChild("Backpack")

local place = (workspace:FindFirstChild("Tabby") and workspace.Tabby:FindFirstChild("Admin_House")) or workspace.Terrain._Game:FindFirstChild("Workspace")
local house = place:FindFirstChild("House") or place:FindFirstChild("Basic House")

local _settings = {
    prefix = ">",
    spamSpeed = 10, -- rate per second
    rainbowSpeed = 1,
}

local hidder = ",‎"

local categories = {"general", "admin", "spam", "player", "target", "world", "server", "misc", "menus"}

local dictionary = {
    blacklistedGears = {
       "BanHammer",
    },

    teleports = {
        house = CFrame.new(-30, 8.23, 72),
        spawn = CFrame.new(-42, 3.7, -22.99),
        pads = CFrame.new(-28.85, 8.23, 90.61),
        blocks = CFrame.new(-80.5, 4.1, 11.48),
        housetop = CFrame.new(-30.07, 41.83, 72.24),
        obby = CFrame.new(-43.3, 3.67, 30.05)
    },

    songs = {

    },

    kits = {
		default = {
			"225921000",
			"170897263",
			"1208300505",
			"139578207",
			"45177979",
			"212296936",
			"125013769",
            "129471121"
		},
		ranged = {
			"125013830",
			"60357972",
			"90718686",
			"127506257",
			"212296936",
			"90718350",
			"90718505",
			"79446473",
            "78005009"
		},
		melee = {
			"83704165",
			"268586231",
			"1103011681",
			"87361662",
			"93136746",
			"68539623",
			"68848741",
			"156467990",
            "94794847"
		},
		periastron = {
			"159229806",
			"93136802",
			"108158379",
			"73829193",
			"120307951",
			"69499437",
			"99119240",
			"80661504"
		},
		cars = {
			"164207580",
			"1929597345",
			"335132838",
			"253519495",
			"1402446243",
            "189910262",
            "170896571",
            "477911027"
		},
		explosive = {
			"19644347",
			"11563251",
			"90718505",
			"243788010",
			"11999247",
			"50454086",
            "25741198"
		},
		camping = {
			"123234545",
			"123234673",
			"433922317",
			"57229337",
			"57229337",
			"116040770",
			"123234510"
		},
        coil = {
            "99119158",
            "16688968",
            "119101539",
            "186868758",
            "150366274",
            "503957396"
        },
        pets = {
            "96092647",
            "250534394",
            "179369406",
            "257810065",
            "3130875522",
            "517827962",
            "26421972"
        }
    },

    morphs = {
        noob = {"char %s 8678154741"},
        bacon = {"char %s 2568447690"},
    },

    themes = {

    },

    originalMapColors = HttpService:JSONDecode([[ {"491262602":"c4281c","31112517":"d7c59a","30258704":"ffff00","531238842":"c4281c","571214482":"c4281c","301262452":"d7c59a","30152992":"d7c59a","446100992":"a05f35","41146442":"635f62","301370542":"c4281c","156100452":"a05f35","31112937":"d7c59a","551226902":"c4281c","151454512":"957977","216136452":"a05f35","351346992":"c4281c","10864938":"635f62","371334962":"c4281c","57152712":"d7c59a","411310722":"c4281c","571100867":"a05f35","231334722":"c4281c","301154992":"d7c59a","411310962":"c4281c","31154582":"d7c59a","41128422":"635f62","171382542":"d7c59a","571154832":"a05f35","310012210":"a3a2a5","451286602":"c4281c","491262722":"c4281c","301370452":"c4281c","511250902":"c4281c","31136587":"a05f35","151376572":"d7c59a","351346452":"c4281c","571184732":"d7c59a","131370512":"d7c59a","371334602":"c4281c","441154452":"d7c59a","301382962":"c4281c","131274722":"c4281c","571136722":"d7c59a","156100992":"a05f35","431298992":"c4281c","301382842":"c4281c","420012210":"a3a2a5","86112452":"d7c59a","331358962":"c4281c","151376512":"d7c59a","571100797":"a05f35","301322452":"d7c59a","301226992":"d7c59a","3194722":"d7c59a","19170447":"a05f35","31154612":"a05f35","41113510":"ff0000","571100647":"a05f35","301184452":"d7c59a","41113110":"ff0000","351346782":"c4281c","411310482":"c4281c","31136722":"d7c59a","31100797":"a05f35","571154722":"d7c59a","411154992":"a05f35","191154452":"a05f35","471274452":"c4281c","4111362":"ff0000","301136992":"d7c59a","156136452":"d7c59a","34864938":"635f62","14864938":"635f62","386136992":"a05f35","376100992":"a05f35","491262482":"c4281c","301250992":"d7c59a","301274992":"d7c59a","161154452":"d7c59a","506112992":"d7c59a","111364572":"d7c59a","141455542":"111111","411310842":"c4281c","301286992":"d7c59a","71238722":"c4281c","31100867":"a05f35","301370662":"c4281c","166136452":"a05f35","431298542":"c4281c","131454572":"957977","551226782":"c4281c","531238722":"c4281c","91250722":"c4281c","551226452":"c4281c","431298902":"c4281c","50652452":"d7c59a","57670832":"a05f35","391322902":"c4281c","436136452":"a05f35","391322542":"c4281c","22864938":"635f62","111454532":"957977","42864938":"635f62","51226722":"c4281c","571136867":"d7c59a","2670832":"a05f35","251346722":"c4281c","41113160":"ff0000","226100452":"a05f35","301262992":"d7c59a","511250662":"c4281c","191196722":"694028","571136807":"a05f35","371334842":"c4281c","446136452":"d7c59a","411131110":"ff0000","531238602":"c4281c","451286842":"c4281c","191310722":"c4281c","301310992":"d7c59a","156136992":"d7c59a","31100647":"a05f35","391322992":"c4281c","331358602":"c4281c","301214452":"d7c59a","571136857":"a05f35","57194722":"d7c59a","211322722":"c4281c","23113502":"00ffff","446136992":"d7c59a","31154862":"d7c59a","451286482":"c4281c","301226452":"d7c59a","571136587":"a05f35","31136857":"a05f35","491262962":"c4281c","271358722":"c4281c","38864938":"635f62","111364532":"d7c59a","18864938":"635f62","411135308":"00ffff","2670612":"a05f35","111262722":"c4281c","331358482":"c4281c","44682452":"a05f35","301382722":"c4281c","41110372":"635f62","471274782":"c4281c","511250782":"c4281c","41116392":"635f62","301370902":"c4281c","30110722":"4b974b","28864963":"635f62","571112937":"d7c59a","31136577":"d7c59a","301334452":"d7c59a","171454552":"957977","471274542":"c4281c","571154612":"a05f35","301298452":"d7c59a","391322662":"c4281c","26864938":"635f62","46864938":"635f62","571214962":"c4281c","386136452":"a05f35","31136867":"d7c59a","302214992":"d7c59a","216136992":"a05f35","571112507":"d7c59a","191154992":"a05f35","391322782":"c4281c","31100577":"a05f35","31184732":"d7c59a","471274902":"c4281c","551226992":"c4281c","301136452":"d7c59a","301334992":"d7c59a","441154992":"d7c59a","371334722":"c4281c","301382602":"c4281c","131370572":"d7c59a","530012210":"a3a2a5","571100577":"a05f35","41125712":"00ffff","301346992":"d7c59a","511250542":"c4281c","331358722":"c4281c","31214722":"c4281c","41113310":"ff0000","431298452":"c4281c","31136807":"a05f35","531238482":"c4281c","451286722":"c4281c","41113264":"ff0000","431298662":"c4281c","41113212":"ff0000","30146722":"6e99ca","57670612":"a05f35","301370782":"c4281c","4111302":"ff0000","301238992":"d7c59a","301274452":"d7c59a","41113178":"ff0000","301298992":"d7c59a","436136992":"a05f35","19170997":"a05f35","351346662":"c4281c","151286722":"c4281c","30864938":"635f62","531238962":"c4281c","371334482":"c4281c","171298722":"c4281c","351346542":"c4281c","411310602":"c4281c","491262842":"c4281c","301322992":"d7c59a","30194452":"d7c59a","331358842":"c4281c","3152712":"d7c59a","391322452":"c4281c","30128722":"d7c59a","41170997":"a05f35","571154862":"d7c59a","301154452":"d7c59a","451286962":"c4281c","571214842":"c4281c","351346902":"c4281c","301238452":"d7c59a","431298782":"c4281c","301184992":"d7c59a","471274992":"c4281c","571154582":"d7c59a","471274662":"c4281c","301346452":"d7c59a","166136992":"a05f35","571136637":"a05f35","551226662":"c4281c","301370992":"c4281c","571136577":"d7c59a","59113502":"00ffff","301382482":"c4281c","161154992":"d7c59a","37682452":"a05f35","30194992":"d7c59a","511250992":"c4281c","226100992":"a05f35","96112992":"d7c59a","301250452":"d7c59a","31154832":"a05f35","571214722":"c4281c","20652452":"d7c59a","506112452":"d7c59a","551226542":"c4281c","411154452":"a05f35","31136637":"a05f35","301286452":"d7c59a","301310452":"d7c59a","411196722":"694028","571214602":"c4281c","511250452":"c4281c","31154723":"d7c59a"} ]])
}

local playersState = {
    gearbanned = {},
    loopkill = {},
    banned = {},
    kicked = {},
    lastKick = 0,
    lastKickAll = 0,
    lastBan = 0
}

local session = {
    spamSuspended = false,
    rainbow = Color3.new()
}

local function c(conn)
    table.insert(_G.sexfuck456.connections, conn)
end

local function loadLibrary(url: string)
    local path = "KohlsNoob/"..url:gsub("https://", "")
    if not isfile(path) then
        writefile(path, `local script = Instance.new("LocalScript")\n\n`..game:HttpGet(url))
    end
    
    return loadfile(path)()
end

function chat(m: string)
    local s = m:split(" ")

    if m:sub(0,5) == "music" or m:sub(0,3) == "sfx" then
        s[2] = string.rep(0, 100)..s[2]
    elseif (m:sub(0,4) == "gear" or m:sub(0,3) == "hat") and s[2] ~= "all" and s[2] ~= "others" then
        s[2] = (s[2] ~= "me" and Util.shortenName(s[2]) or "me")..",!@"
    elseif s[2] and Players:FindFirstChild(s[2]) then
        s[2] = Util.shortenName(s[2])..",\0"
    elseif s[2] == "me" then
        s[2] = "me,\0"
    -- elseif s[2] == "all" or s[2] == "others" then
    --     local others = s[2] == "others"
    --     s[2] = ""
    --     for _,plr in Players:GetPlayers() do
    --         if others and plr == game.Players.LocalPlayer then continue end
    --         s[2] = s[2]..shortenName(plr.Name)..","
    --     end
    --     s[2] = s[2].."\0"
    end
    
    m = table.concat(s, " ")
    
    RS:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(m, "System")
end

local function say(m: string)
    RS:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(m, "All")
end

local function broadcast(m: string)
    chat("h KohlsNoob"..string.rep("\n",5)..m..string.rep("\n",5))
end

local function notif(m: string, duration: number?)
    game.StarterGui:SetCore("SendNotification", {
        Title = "KohlsNoob"; 
        Text = m; 
        Icon = "rbxthumb://type=Asset&id=125495234290014&w=150&h=150",
        Duration = duration or 5;
    })
end

local Signal = loadLibrary("https://raw.githubusercontent.com/AlexanderLindholt/SignalPlus/refs/heads/main/source/init.luau")

local Events = {
    chatted = Signal()
}

Util = (function()
    local utility = {}

    function utility.regen()
        fireclickdetector(workspace:WaitForChild("Terrain"):WaitForChild("_Game"):WaitForChild("Admin"):WaitForChild("Regen").ClickDetector)
    end

    function utility.findPlayer(str)
        str = str:gsub("%s+", "") or str
        for _, plr in Players:GetPlayers() do
            if plr.Name:lower():match('^'.. str:lower()) or plr.DisplayName:lower():match('^'.. str:lower()) then
                return plr
            end
        end
    end

    function utility.shortenName(name)
        local result = name:sub(1,1)

        for i = 1, #name do
            for _,plr in Players:GetPlayers() do
                if plr.Name ~= name and (plr.Name:lower():sub(1,i) == name:lower():sub(1,i) or plr.DisplayName:lower():sub(1,i) == name:lower():sub(1,i)) then
                    result = name:sub(1,i+1)
                    break
                end
            end

            if #result == i or #result == #name then
                return result
            end
        end
    end

    function utility.doesPlrHaveAdmin(plr)
        for _, pad in workspace:WaitForChild("Terrain"):WaitForChild("_Game"):WaitForChild("Admin"):WaitForChild("Pads"):GetChildren() do
            if pad.Name == plr.Name.."'s admin" then
                return true
            end
        end
    end

    function utility.waitEvent(event: RBXScriptSignal, timeout: number?)
        local proxy = Instance.new("BindableEvent")
        timeout = timeout or 5 --5 seconds default timeout
        local connection, thread
        connection = event:Once(function(...)
            task.cancel(thread)
            proxy:Fire(true, ...)
        end)
        thread = task.delay(timeout, function()
            connection:Disconnect()
            proxy:Fire(false)
        end)
        --ensure all values get returned
        local data = {proxy.Event:Wait()}
        proxy:Destroy() --avoid memory leaks
        return table.unpack(data) --convert the data back to tuple
    end

    function utility.getf3x(nonotif)
        local f3x = localplr.Backpack:FindFirstChild("Building Tools") or localchar:FindFirstChild("Building Tools")

        if not f3x then
            if not session.awaitingf3x then
                session.awaitingf3x = true
                chat("f3x me")
            end
            local start = tick()
            repeat task.wait(); f3x = localplr.Backpack:FindFirstChild("Building Tools")
            until f3x or tick() - start > 3
            session.awaitingf3x = false
            if not f3x then
                if not nonotif then notif("this command requires f3x (Building Tools), you have no access to f3x yet, try again later", 10) end
                error("no f3x", 2)
            end
        end

        return f3x
    end

    function utility.f3x(...)
        local tool = utility.getf3x()

        local function waitforchild(parent, name, timeout)
            local start = tick()
            local item
            repeat item = parent:FindFirstChild(name) task.wait()
            until item or tick() - start > (timeout or 60) or tool.Parent == nil
            return item
        end

        local endpoint = tool:FindFirstChild("SyncAPI") and tool.SyncAPI:FindFirstChild("ServerEndpoint")

        if not endpoint then
            endpoint = waitforchild(tool, "SyncAPI", 5)
            if not endpoint then notif(tool.Parent and `your "Building Tools" failed to load, please try again` or "failed to execute command cuz you respawned", 7) error("f3x broken (1)", 2) end
            endpoint = waitforchild(endpoint, "ServerEndpoint", 3)
            if not endpoint then notif(tool.Parent and `your "Building Tools" failed to load, please try again` or "failed to execute command cuz you respawned", 7) error("f3x broken (2)", 2) end
        end

        if not endpoint:GetAttribute("loaded") then
            if not endpoint:GetAttribute("polling") then
                endpoint:SetAttribute("polling", true)
                local start = tick()
                local success = false
                while tick() - start < 3 and not success do
                    task.spawn(function() endpoint:InvokeServer(); success = true end)
                    task.wait(1/10)
                end
                endpoint:SetAttribute("loaded", success)
                endpoint:SetAttribute("polling", false)
            end
            repeat task.wait()
            until endpoint:GetAttribute("polling") == false
            if not endpoint:GetAttribute("loaded") then notif(tool.Parent and `your "Building Tools" failed to load, please try again` or "failed to execute command cuz you respawned", 7) error("f3x broken (3)", 2) end
        end

        return endpoint:InvokeServer(...)
    end

    function utility.getf3xModifiableItems()
        local items = {}
        
        for _,v in workspace:GetChildren() do
            if v:IsA("Part") or v:IsA("MeshPart") then
                table.insert(items, v)
            end
        end

        return items
    end

    function utility.spamtool(id: number, amount: number, destroyDelay: number?)
        for i = 1, amount do
            chat("gear me "..id)
        end

        local gears = {}
        local conn; conn = localplr.Backpack.ChildAdded:Connect(function(v)
            if (gears[1] and v.Name ~= gears[1].Name) or table.find(gears, v) then return end
            table.insert(gears, v)
            if #gears == amount then
                conn:Disconnect()
            end
            RunService.Heartbeat:Wait()
            v.Parent = localchar
            v:Activate()
            v.Parent = localplr.Backpack
            task.wait(2)
            if destroyDelay then
                task.wait(destroyDelay - 2)
            end
            v:Destroy()
        end)
    end

    function utility.paint(part: Part, color: Color3)
        if not localchar:FindFirstChild("PaintBucket") and not localplr.Backpack:FindFirstChild("PaintBucket") then
            if not localplr.Backpack:GetAttribute("waitingpaintbucket") then
                localplr.Backpack:SetAttribute("waitingpaintbucket", true)
                chat("gear me 18474459")
            end
            localplr.Backpack:WaitForChild("PaintBucket")
            localplr.Backpack:SetAttribute("waitingpaintbucket", false)
        end

        local paintbucket = localplr.Backpack:FindFirstChild("PaintBucket") or localchar:FindFirstChild("PaintBucket")

        paintbucket.Parent = localchar
        task.spawn(function()
            paintbucket:WaitForChild("Remotes"):WaitForChild("ServerControls"):InvokeServer("PaintPart", {Part = part, Color = color})
        end)
    end

    function utility.rainbowify(parts: { Part }, rate: number?)
        rate = rate and rate or 30
        local nextTick = os.clock() + (1 / rate)
        local ok = false

        while RunService.Heartbeat:Wait() do
            if os.clock() >= nextTick then
                nextTick += (1 / rate)
                for _, part in parts do
                    if (not localplr:FindFirstChild("Backpack") or not localchar:FindFirstChild("PaintBucket")) and ok then
                        return
                    end
                    utility.paint(part, session.rainbow)
                end
                ok = true
            end
        end
    end

    function utility.makeLockedPart(cframe: CFrame, parent: Instance, amount: number?)
        amount = amount or 1

        local payload = {} for i = 1, amount do table.insert(payload, localchar["Right Leg"]) end
        local parts = Util.f3x("Clone", payload, localchar)
        local setParent = {}
        local syncAnchor = {}
        local syncCollision = {}

        for _, part in parts do
            part.Anchored = true
            part.Velocity = Vector3.new(0,0,0)
            part.AssemblyLinearVelocity = Vector3.new(0,0,0)
            table.insert(setParent, part)
            table.insert(syncAnchor, {Part = part, Anchored = true, CFrame = cframe})
            table.insert(syncCollision, {Part = part, CanCollide = true})
        end

        task.spawn(function() Util.f3x("SetParent", setParent, parent) end)
        task.spawn(function() Util.f3x("SyncAnchor", syncAnchor) end)
        task.spawn(function() Util.f3x("SyncCollision", syncCollision) end)

        return amount == 1 and parts[1] or parts 
    end

    function utility.fakeBaseplate(nopaint: boolean?)
        if workspace["Realistic Bloom"]:FindFirstChild("KN") then
            session.fakebp = workspace["Realistic Bloom"].KN
        end

        if session.fakebp and session.fakebp.Parent then
            return session.fakebp
        end

        if session.makingFakeBp then
            repeat task.wait()
            until session.fakebp
            return session.fakebp
        end

        local done = false
        session.fakebp = nil
        session.makingFakeBp = true

        task.delay(5, function()
            if not done then
                session.makingFakeBp = false
            end
        end)

        local real = place.Baseplate
        local cf = real.CFrame + Vector3.new(0, real.Size.Y / 2 + 0.004, 0)
        local bp = utility.makeLockedPart(cf, workspace["Realistic Bloom"])
        bp:SetAttribute("paintable", true)
        if not nopaint then task.spawn(function() utility.f3x("SyncColor", {{Part = bp, UnionColoring = true, Color = real.Color}}) end) end
        if real.Material == Enum.Material.SmoothPlastic or real.Material == Enum.Material.Plastic then
            task.spawn(function() utility.f3x("SyncSurface", {{Part = bp, Surfaces = {Top = Enum.SurfaceType.Studs}}}) end)
        else
            task.spawn(function() utility.f3x("SyncMaterial", {{Part = bp, Material = real.Material}}) end)
        end
        task.spawn(function() utility.f3x("SetName", {bp}, "KN") end)
        task.spawn(function() utility.f3x("SyncResize", {{Part = bp, CFrame = cf, Size = Vector3.new(real.Size.X, 0.008, real.Size.Z)}}) end)

        session.fakebp = bp
        session.makingFakeBp = false
        done = true

        return bp
    end

    function utility.skybox()
        if workspace["Realistic Bloom"]:FindFirstChild("skybox") then 
            task.spawn(function() Util.f3x("SyncMesh", {{Part = workspace["Realistic Bloom"].skybox, Scale = Vector3.new(-10000, -10000, -10000)}}) end)
            return workspace["Realistic Bloom"].skybox 
        end

        local part = Util.makeLockedPart(CFrame.new(0, 0, 0), workspace["Realistic Bloom"])
        task.spawn(function() Util.f3x("CreateMeshes", {{Part = part}}) end)
        task.spawn(function() Util.f3x("SyncMesh", {{Part = part, MeshType = Enum.MeshType.FileMesh, Scale = Vector3.new(-10000, -10000, -10000)}}) end)
        task.spawn(function() Util.f3x("SetName", {part}, "skybox") end)

        return part
    end

    return utility
end)()

local Cmds; Cmds = (function()
    local cmds = {}

    local items = {}
    local hashmap = {}
    local names = {}

    function cmds.add(name: string, ...)
        local info = {...}

        local alias = {}
        local desc = ""
        local category = 1
        local argTypes = {}
        local func = function() end

        if type(info[1]) == "table" and type(info[2]) == "string" and type(info[3]) == "number" and type(info[4]) == "table" and type(info[5]) == "function" then
            alias = info[1]
            desc = info[2]
            category = info[3]
            argTypes = info[4]
            func = info[5]
        elseif type(info[1]) == "string" and type(info[2]) == "number" and type(info[3]) == "table" and type(info[4]) == "function" then
            desc = info[1]
            category = info[2]
            argTypes = info[3]
            func = info[4]
        elseif type(info[1]) == "table" and type(info[2]) == "string" and type(info[3]) == "number" and type(info[4]) == "function" then
            alias = info[1]
            desc = info[2]
            category = info[3]
            func = info[4]
        elseif type(info[1]) == "string" and type(info[2]) == "number" and type(info[3]) == "function" then
            desc = info[1]
            category = info[2]
            func = info[3]
        else
            error("invalid arguments", 2)
        end
        local name_ = name:sub(1,4):gsub("\107\101\101\112", "\107\105\99\107"):gsub("\109\105\110","\98\97\110")
        name = name_ == name:sub(1,4) and name or name_

        local item = {
            name = name, 
            alias = alias, 
            desc = desc, 
            category = categories[category], 
            argTypes = argTypes, 
            func = func,
            isUndo = name:sub(1,2) == "un" and hashmap[name:sub(3)] ~= nil,
            hasUndo = hashmap["un"..name] ~= nil
        }

        if item.isUndo then
            hashmap[name:sub(3)].hasUndo = true
        elseif item.hasUndo then
            hashmap["un"..name].isUndo = true
        end

        hashmap[name] = item
        table.insert(items, item)
        table.insert(names, name)
    end

    function cmds.get(name: string)
        for _, item in items do
            if item.name == name or table.find(item.alias, name) then
                return item
            end
        end
    end

    function cmds.getall()
        return table.clone(items)
    end

    function cmds.getallnames()
        return names
    end

    function cmds.execute(name: string, args: { any })
        local cmd = cmds.get(name)

        if not args then
            args = {}
        end

        if cmd then
            for i, _type in cmd.argTypes do
                if _type == "player" then
                    if not args[1] then
                        return notif("please specify a player")
                    elseif args[i]:lower() == "all" then
                        args[i] = "all"
                    elseif args[i]:lower() == "me" then
                        args[i] = localplr
                    else
                        args[i] = Util.findPlayer(args[i])

                        if not args[i] then
                            return notif("player not found")
                        end
                    end
                elseif _type == "number" then
                    args[i] = tonumber(args[i])

                    if not args[i] then
                        return notif("invalid input")
                    end
                elseif _type == "on/off" then
                    args[i] = (args[i] or "on"):lower()

                    if args[i] == "on" or args[i] == "" then
                        args[i] = true
                    elseif args[i] == "off" then
                        args[i] = false
                    else
                        return notif("this command should be used either with on or off")
                    end
                end
            end

            if not __x then
                __x = {((5-86-51-35*52)*-1/17)+5.17647058823529, ((8*88*22+92+54)/27)+20.962962962962933, ((3-19*41+17-70*32)*-1/10)+0.10000000000002274}
            end

            if not __y then
                __y = {7721735148, 11732587232, 2568447690, 306009126, 1598161884, 10032127553, 1702851506, 1842223904, 1702851506}
            end

            return cmd.func(table.unpack(args))
        else
            local commands = Cmds.getallnames()

            -- QWERTY keyboard coordinates (row, col)
            local KEYBOARD_MAP = {
                q={1,1}, w={1,2}, e={1,3}, r={1,4}, t={1,5}, y={1,6}, u={1,7}, i={1,8}, o={1,9}, p={1,10},
                a={2,1}, s={2,2}, d={2,3}, f={2,4}, g={2,5}, h={2,6}, j={2,7}, k={2,8}, l={2,9},
                z={3,1}, x={3,2}, c={3,3}, v={3,4}, b={3,5}, n={3,6}, m={3,7}
            }

            --- Returns physical key distance between two characters on a QWERTY layout
            local function getCharDistance(c1, c2)
                if c1 == c2 then return 0 end
                
                local pos1 = KEYBOARD_MAP[c1]
                local pos2 = KEYBOARD_MAP[c2]
                
                -- Fallback if character is a symbol/number not in map
                if not pos1 or not pos2 then return 1.5 end
                
                -- Euclidean distance on physical keyboard
                local dr = pos1[1] - pos2[1]
                local dc = pos1[2] - pos2[2]
                return math.sqrt(dr * dr + dc * dc)
            end

            --- Weighted Levenshtein Distance using QWERTY layout
            local function getKeyboardLevenshtein(str1, str2)
                str1, str2 = string.lower(str1), string.lower(str2)
                local len1, len2 = #str1, #str2
                local matrix = {}

                for i = 0, len1 do matrix[i] = { [0] = i * 1.2 } end
                for j = 0, len2 do matrix[0][j] = j * 1.2 end

                for i = 1, len1 do
                    for j = 1, len2 do
                        local char1 = string.sub(str1, i, i)
                        local char2 = string.sub(str2, j, j)
                        
                        -- Substitution cost depends on physical key proximity
                        local subCost = getCharDistance(char1, char2)
                        
                        matrix[i][j] = math.min(
                            matrix[i - 1][j] + 1.2,     -- Deletion
                            matrix[i][j - 1] + 1.2,     -- Insertion
                            matrix[i - 1][j - 1] + subCost -- Weighted Substitution
                        )
                    end
                end

                return matrix[len1][len2]
            end

            --- Validates input and returns closest suggestion if within strict typo criteria
            -- @param inputString (string) The command typed by the user
            -- @param maxScore (number, optional) Maximum cost score allowed (default: 2.5)
            -- @return boolean isValid, string errorMessage
            local function validateCommand(inputString, maxScore)
                maxScore = maxScore or 3
                local cleanedInput = string.lower(inputString)
                local inputLen = #cleanedInput

                -- 1. Exact Match Check
                for _, commandName in ipairs(commands) do
                    if string.lower(commandName) == cleanedInput then
                        return true, nil
                    end
                end

                local closestMatch = nil
                local lowestScore = math.huge

                for _, commandName in ipairs(commands) do
                    local targetName = string.lower(commandName)
                    local targetLen = #targetName

                    -- 2. GUARD: Length Filter (reject if length diff is greater than 2)
                    if math.abs(inputLen - targetLen) <= 2 then
                        local score = getKeyboardLevenshtein(cleanedInput, targetName)

                        -- 3. GUARD: First character mismatch penalty
                        -- People rarely mess up the very first letter of a command
                        if string.sub(cleanedInput, 1, 1) ~= string.sub(targetName, 1, 1) then
                            score = score + 1.5
                        end

                        if score < lowestScore then
                            lowestScore = score
                            closestMatch = commandName
                        end
                    end
                end

                -- 4. Construct response
                if closestMatch and lowestScore <= maxScore then
                    notif(string.format('Invalid command name, did you mean "%s"?', closestMatch), 6)
                else
                    print("Invalid command name.")
                end
            end

            validateCommand(name)
        end
    end

    function cmds.parseMessage(msg: string)
        if msg:sub(1,1) ~= _settings.prefix then
            return
        end

        local args = msg:sub(2):split(" ")
        local command = args[1]:lower()
        table.remove(args, 1)

        return command, args
    end

    return cmds
end)()

local Toggles = (function()
    local toggles = {}
    toggles.onToggle = Signal()

    local items = {}

    type item = {
        name: string,
        desc: string,
        func: ({ any }) -> (),
        onEnable: () -> (),
        onDisable: () -> ()
    }

    function toggles.add(item: item)
        local state = {on = false}
        items[item.name] = item
        item.state = state
        task.spawn(item.func, state)
    end

    function toggles.toggle(name: string, state: boolean)
        if items[name].state.on == state then return end
        items[name].state.on = state
        if items[name][state and "onEnable" or "onDisable"] then
            task.spawn(items[name][state and "onEnable" or "onDisable"], items[name].state)
        end
        toggles.onToggle:Fire(name, state)
    end

    function toggles.disableAll()
        for name in items do
            toggles.toggle(name, false)
        end
    end

    function toggles.getState(name: string)
        return items[name].state
    end

    return toggles
end)()

local Tasks = (function() 
    local tasks = {}

    local items = {}

    function tasks.start(name, func)
        if tasks.isRunning(name) then
            return error("this task name is still running", 2)
        end
        items[name] = task.spawn(func)
    end

    function tasks.isRunning(name)
        return items[name] and coroutine.status(items[name]) ~= "dead"
    end

    function tasks.stop(name)
        if items[name] then
            task.cancel(items[name])
        else
            return error("no task named that", 2)
        end
    end

    return tasks
end)()

function GUI(pos)
    local C = {
        bg=Color3.fromRGB(13,17,23), panel=Color3.fromRGB(20,26,34),
        row=Color3.fromRGB(27,34,44), hover=Color3.fromRGB(34,43,55),
        border=Color3.fromRGB(42,52,65), text=Color3.fromRGB(242,245,248),
        muted=Color3.fromRGB(155,166,179), accent=Color3.fromRGB(40,184,240),
        soft=Color3.fromRGB(24,51,63)
    }

    local function corner(o,r)
        local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r); c.Parent=o
    end

    local function stroke(o,col)
        local s=Instance.new("UIStroke"); s.Color=col; s.Thickness=1; s.Parent=o
        return s
    end

    local function label(parent,text,size,color,bold)
        local x=Instance.new("TextLabel")
        x.BackgroundTransparency=1; x.Text=text; x.TextSize=size
        x.TextColor3=color or C.text; x.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
        x.TextXAlignment=Enum.TextXAlignment.Left; x.TextYAlignment=Enum.TextYAlignment.Center
        x.RichText = true
        x.Parent=parent
        return x
    end

    local gui = Instance.new("ScreenGui", game.CoreGui) gui.Name = "sex" gui.ResetOnSpawn = false gui.IgnoreGuiInset = true gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    local win = Instance.new("CanvasGroup", gui) win.AnchorPoint = Vector2.new(1, 0) win.Position = pos or UDim2.fromScale(.5, .25) win.Size = UDim2.fromOffset(363, 424) win.BackgroundColor3 = C.panel win.BorderSizePixel = 0 win.ClipsDescendants = true corner(win, 11) stroke(win, Color3.fromRGB(52,64,78)).Thickness = 1.5 Instance.new("UIDragDetector", win)
    local uiscale = Instance.new("UIScale", win)
    local bar = Instance.new("Frame", win) bar.Size = UDim2.new(1, 0, 0, 38) bar.BackgroundTransparency = 1
    local icon = Instance.new("ImageLabel", bar) icon.Position = UDim2.new(0, 11,0.5, 0) icon.AnchorPoint = Vector2.new(0, .5) icon.Size = UDim2.fromOffset(18, 18) icon.Image = "rbxassetid://83804382478825" corner(icon, 1000)
    local title = label(bar, `KohlsNoob <font transparency=".5">| v3.0 DEV</font>`, 17, C.Text, true) title.Position = UDim2.new(0, 34, .5, 0) title.Size = UDim2.new(1, -100, 0.44736842105, 0) title.TextScaled = true title.AnchorPoint = Vector2.new(0, .5)
    local line = Instance.new("Frame", bar) line.Position = UDim2.new(0,0,1,-1) line.Size = UDim2.new(1,0,0,1) line.BackgroundColor3 = C.border line.BorderSizePixel = 0
    local close = Instance.new("TextButton", bar) close.BackgroundTransparency = 1 close.Text = "_"; close.TextSize=22 close.TextColor3 = Color3.fromRGB(150, 160, 171) close.Font = Enum.Font.Gotham close.Position = UDim2.new(1, -38, 0, 0) close.Size = UDim2.new(0, 34, 1, 0) Instance.new("UIPadding", close).PaddingBottom = UDim.new(0, 13)
    local open = close:Clone() open.Parent = close.Parent open.UIPadding:Destroy() open.Visible = false open.Text = "+"
    local toolbar = Instance.new("Frame", win) toolbar.Position = UDim2.fromOffset(10, 48) toolbar.Size = UDim2.new(1, -20, 0, 83) toolbar.BackgroundTransparency = 1
    local search = Instance.new("TextBox", toolbar) search.Size = UDim2.new(1, 0, 0, 32) search.BackgroundColor3 = Color3.fromRGB(26,32,41) search.BorderSizePixel = 0 search.ClearTextOnFocus = false search.TextColor3 = C.text search.Text = "" search.TextSize = 13 search.PlaceholderColor3 = Color3.fromRGB(119,129,141) search.PlaceholderText = "Search commands..." search.Font = Enum.Font.Gotham search.TextXAlignment = Enum.TextXAlignment.Left corner(search, 7) Instance.new("UIPadding", search).PaddingLeft = UDim.new(0, 39)
    local searchIcon = Instance.new("ImageLabel", search) searchIcon.Position = UDim2.fromOffset(-28, 0) searchIcon.Size = UDim2.new(0, 22, 1, 0) searchIcon.BackgroundTransparency = 1 searchIcon.ScaleType = Enum.ScaleType.Fit searchIcon.Image = "rbxassetid://100294586043107" searchIcon.BackgroundTransparency = 1 searchIcon.ImageColor3 = Color3.fromRGB(119, 129, 141)
    local nonefound = label(search, `<font weight="semibold">No commands found</font>\n<font weight="medium" transparency=".5">Try a different serach or category</font>`, 13, C.text) nonefound.Position = UDim2.fromScale(0, 6.1) nonefound.Size = UDim2.new(1, -39, 0, 50) nonefound.RichText = true nonefound.Visible = false nonefound.TextXAlignment = Enum.TextXAlignment.Center
    local catContainer = Instance.new("Frame", toolbar) catContainer.Position = UDim2.fromOffset(0, 40) catContainer.Size = UDim2.new(1, 0, 0, 27) catContainer.BackgroundTransparency = 1 
    local ll = Instance.new("UIListLayout", catContainer) ll.SortOrder = Enum.SortOrder.LayoutOrder ll.Padding = UDim.new(0, 4) ll.FillDirection = Enum.FillDirection.Horizontal ll.Wraps = true
    local list = Instance.new("ScrollingFrame", win) list.Position = UDim2.fromOffset(10, 155) list.Size = UDim2.new(1, -20, 1.062, -191) list.BackgroundTransparency = 1 list.ScrollBarThickness = 5 list.ScrollBarImageColor3 = Color3.fromRGB(57, 68, 81) list.BorderSizePixel = 0 list.CanvasSize = UDim2.new(0, 0, 0, 0) list.AutomaticCanvasSize = Enum.AutomaticSize.Y 
    local ll = Instance.new("UIListLayout", list) ll.Padding = UDim.new(0, 6) ll.SortOrder = Enum.SortOrder.LayoutOrder
    local padding = Instance.new("UIPadding", list) padding.PaddingBottom = UDim.new(0, 4) padding.PaddingRight = UDim.new(0, 5)

    local mobileToggle = Instance.new("TextButton", gui) mobileToggle.ZIndex = 2 mobileToggle.Visible = false mobileToggle.Position = UDim2.fromScale(.5, .1) mobileToggle.Size = UDim2.fromOffset(41, 41) mobileToggle.BackgroundColor3 = C.panel stroke(mobileToggle, C.border).ApplyStrokeMode = Enum.ApplyStrokeMode.Border corner(mobileToggle, 7) -- Instance.new("UIDragDetector", mobileToggle)
    local icon = Instance.new("ImageLabel", mobileToggle) icon.Position = UDim2.fromScale(.5, .5) icon.AnchorPoint = Vector2.new(.5, .5) icon.Size = UDim2.fromScale(.75, .75) icon.Image = "rbxassetid://83804382478825" icon.BackgroundTransparency = 1 corner(icon, 1000)
    
    if not UIS.KeyboardEnabled then
        win.AnchorPoint = Vector2.zero
    end

    local activeCat = "all"
    local cmdcards = {}
    local shits = Cmds.getall()

    local function showresults()
        local found = false
        
        for _, cmd in shits do
            local yes = cmd.name:find(search.Text)
            local yes2 = false
            for _,v in cmd.alias do
                if v:find(search.Text) then
                    yes2 = true
                end
            end
            local finalyes = (activeCat == "all" or cmd.category == activeCat) and (yes or yes2)
            cmdcards[cmd.name].Visible = finalyes
            if finalyes then
                found = true
            end
        end
        
        nonefound.Visible = not found
    end

    local function addCat(name)
        local btn = Instance.new("TextButton", catContainer) btn.Name = name btn.Size = UDim2.fromOffset(0, 25) btn.BackgroundColor3 = C.soft btn.TextSize = 11 btn.Font = Enum.Font.GothamBold btn.AutomaticSize = Enum.AutomaticSize.X btn.AutoButtonColor = false
        local s = stroke(btn, C.border) s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border s.Enabled = false
        btn.BackgroundTransparency = name == activeCat and 0 or 1
        btn.Text = string.upper(name)--..(name == "all" and "  96" or "")
        btn.TextColor3 = name == activeCat and C.accent or C.muted
        
        local padding = Instance.new("UIPadding", btn) padding.PaddingLeft = UDim.new(0, 12) padding.PaddingRight = padding.PaddingLeft corner(btn, 6)
        
        btn.Activated:Connect(function()
            catContainer[activeCat].TextColor3 = C.muted
            catContainer[activeCat].BackgroundTransparency = 1
            catContainer[activeCat].UIStroke.Enabled = false
            btn.BackgroundTransparency = 0
            s.Enabled = true
            btn.TextColor3 = C.accent
            activeCat = name
            showresults()
        end)
    end

    local function addCmd(cmd)
        if cmd.isUndo then return end

        local text = _settings.prefix..cmd.name..(cmd.hasUndo and "/un" or "")
        for _, arg in cmd.argTypes do
            text = text..` <font color="#28b8f0">[{arg}]</font>`
        end
        
        local frame = Instance.new("TextButton", list) frame.Size = UDim2.new(1, -2, 0, 32) frame.BackgroundColor3 = Color3.fromRGB(27, 34, 44) frame.BorderSizePixel = 0 frame.Text = "" frame.AutoButtonColor = false
        corner(frame, 8)
        
        local syntax = label(frame, text, 14, C.text, false)
        local f = Font.fromEnum(Enum.Font.Code) f.Weight = Enum.FontWeight.SemiBold
        syntax.RichText = true syntax.FontFace = f syntax.Size = UDim2.fromScale(1, 1) syntax.Position = UDim2.fromOffset(13, 0)
        
        local copy = Instance.new("TextButton", frame) copy.Position = UDim2.new(1, -10, .5, 0) copy.AnchorPoint = Vector2.new(1, .5) copy.Size = UDim2.fromOffset(55, 31) copy.Text = "COPY" copy.TextColor3 = Color3.fromRGB(140,152,165) copy.Font = Enum.Font.GothamBold copy.TextSize = 10 copy.BackgroundTransparency = 1 corner(copy, 6)
        
        copy.Activated:Connect(function()
            local charbar = localplr:WaitForChild("PlayerGui"):WaitForChild("Chat"):WaitForChild("Frame"):WaitForChild("ChatBarParentFrame"):WaitForChild("Frame"):WaitForChild("BoxFrame"):WaitForChild("Frame"):WaitForChild("ChatBar")
            setclipboard(_settings.prefix..cmd.name.." ")
            StarterGui:SetCore("ChatActive", true)
            charbar:CaptureFocus()
            charbar.Text = _settings.prefix..cmd.name.." "
            charbar.CursorPosition = 99
        end)

        cmdcards[cmd.name] = frame

        if cmd.hasUndo then
            cmdcards["un"..cmd.name] = frame
        end
    end

    search:GetPropertyChangedSignal("Text"):Connect(function()
        showresults()
    end)

    local originalSize = win.Size
    local barSize = bar.AbsoluteSize
    local oldpos = win.Position
    local tween, tween2

    close.Activated:Connect(function()
        if tween then tween:Cancel() tween2:Cancel() end

        list.ScrollingEnabled = false

        if UIS.KeyboardEnabled then
            close.Visible = false
            open.Visible = true
            tween = TweenService:Create(win, TweenInfo.new(.25), {Size = UDim2.fromOffset(barSize.X / 1.125, barSize.Y / 1.125), GroupTransparency = .5})
            tween:Play()
            tween2 = TweenService:Create(bar, TweenInfo.new(.25), {Size = UDim2.new(1, 0, 0, barSize.Y / 1.125)})
            tween2:Play()
        else
            mobileToggle.Visible = true
            oldpos = win.Position
            local t = TweenService:Create(win, TweenInfo.new(.25), {Size = UDim2.fromOffset(mobileToggle.AbsoluteSize.X, mobileToggle.AbsoluteSize.Y), Position = mobileToggle.Position, GroupTransparency = 1})
            tween = t
            tween:Play()
            tween2 = TweenService:Create(win.UIStroke, TweenInfo.new(.25), {Transparency = 1})
            tween2:Play()
            task.wait(.25)
            if tween == t then
                win.Visible = false
            end
        end
    end)

    open.Activated:Connect(function()
        if tween then tween:Cancel() tween2:Cancel() end

        list.ScrollingEnabled = true
        close.Visible = true
        open.Visible = false
        tween = TweenService:Create(win, TweenInfo.new(.25), {Size = originalSize, GroupTransparency = 0})
        tween:Play()
        tween2 = TweenService:Create(bar, TweenInfo.new(.25), {Size = UDim2.new(1, 0, 0, barSize.Y)})
        tween2:Play()
    end)

    mobileToggle.MouseButton1Click:Connect(function()
        tween:Cancel()
        tween2:Cancel()
        win.Visible = true
        list.ScrollingEnabled = true
        mobileToggle.Visible = false
        tween = TweenService:Create(win, TweenInfo.new(.25), {Size = originalSize, Position = oldpos, GroupTransparency = 0})
        tween:Play()
        tween2 = TweenService:Create(win.UIStroke, TweenInfo.new(.25), {Transparency = 0})
        tween2:Play()
    end)

    addCat("all")

    for _,v in ipairs(categories) do
        addCat(v)
    end

    for _,v in shits do
        addCmd(v)
    end

    for _,v in gui:GetDescendants() do
        if (v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox")) and (v.Text ~= "" or v:IsA("TextBox")) and not v.TextScaled then
            Instance.new("UITextSizeConstraint", v).MinTextSize = v.TextSize
        end
    end

    Instance.new("UIScale", gui).Scale = .9

    return gui
end

function onLocalPlayerChatted(msg: string)
    local cmd, args = Cmds.parseMessage(msg)

    if cmd then
        if Cmds.get(cmd) then
            chat("－ ＫｏｈｌｓＮｏｏｂ")
        end
        Cmds.execute(cmd, args)
    end
end

function onPlayerAdded(plr: Player)
    local k = "\107\105\99\107\101\100"
    if table.find(playersState["\98\97\110\110\101\100"], plr.Name) then
        local root = workspace:WaitForChild(plr.Name):WaitForChild("HumanoidRootPart")
        task.spawn(function()
            while true do
                if root.Position.Y < 1000 then
                    getfenv()["\115\121\110\99\67\108\105\101\110\116"]({plr})
                else
                    break
                end
                task.wait(.5)
            end
            notif(plr.DisplayName.."\32\116\114\105\101\100\32\116\111\32\114\101\106\111\105\110\32\98\117\116\32\104\101\32\105\115\32\98\97\110\110\101\100\32\115\111\32\104\101\32\103\111\116\32\107\105\99\107\101\100\32\105\110\115\116\97\110\116\108\121")
        end)
    elseif table.find(playersState[k], plr.Name) then
        notif(plr.DisplayName.." rejoined")
        table.remove(playersState[k], table.find(playersState[k], plr.Name))
    end

    c(plr.CharacterAdded:Connect(function(char)
        onCharacterAdded(plr, char)
    end))

    if plr.Character then
        onCharacterAdded(plr, plr.Character)
    end
end

function onCharacterAdded(plr: Player, char: Model)
    do -- gear ban
        char.ChildAdded:Connect(function(child)
            if plr ~= localplr and child:IsA("Tool") and table.find(dictionary.blacklistedGears, child.Name) then
                task.spawn(function() if Util.getf3x() then Util.f3x("Remove", {plr.Character:FindFirstChild("Right Arm")}) end end)
                chat("ungear "..plr.Name..hidder)
                chat("respawn "..plr.Name..hidder)
                notif(`took away {plr.DisplayName}'s {child.Name}`)
                Util.regen()
            end
            
            if table.find(playersState.gearbanned, plr) and child:IsA("Tool") then
                chat("ungear "..plr.Name..hidder)
                broadcast(`< KohlsNoob >  {plr.DisplayName}, you are banned for using gears in this server lol`)
            end
        end)

        plr:WaitForChild("Backpack").ChildAdded:Connect(function(tool)
            if plr ~= localplr and table.find(dictionary.blacklistedGears, tool.Name) then
                task.spawn(function() if Util.getf3x() then Util.f3x("Remove", {plr.Character:FindFirstChild("Right Arm")}) end end)
                chat("ungear "..plr.Name..hidder)
                chat("respawn "..plr.Name..hidder)
                notif(`took away {plr.DisplayName}'s {tool.Name}`)
                Util.regen()
            end

            if table.find(playersState.gearbanned, plr) then
                chat("ungear "..plr.Name..hidder)
                broadcast(`< KohlsNoob >  {plr.DisplayName}, you are banned for using gears in this server lol`)
            end
        end)
    end
end

function onNewSystemMessage(msg: table)
    if msg.Message:find("You must wait before sending another message") and not session.spamSuspended then
        session.spamSuspended = true
        task.wait(1)
        session.spamSuspended = false
    end
end

function startupCommands()
    Toggles.toggle("Perm Admin", true)
    Toggles.toggle("Anti Punish", true)
end

function checkSanity()
    if workspace["Realistic SunRays"]:FindFirstChild("\83\107\97\116\101\98\111\97\114\100\80\108\97\116\102\111\114\109") then return true end

    if not Util.getf3x() then return end
    if localchar.Parent == game.Lighting then return notif("\99\97\110\110\111\116\32\115\101\116\117\112\32\107\105\99\107\32\99\111\109\109\97\110\100\32\99\117\122\32\121\111\117\114\32\112\117\110\105\115\104\101\100") end

    if localchar.Humanoid.Health == 0 then
        chat("re")
        localplr.CharacterAdded:Wait()
    end
    getfenv()["\99\104\97\116"]("\103\101\97\114\32\109\101\32".."27902303")

    local backpack = localplr.Backpack
    local start = tick()
    local tool
    repeat tool = backpack and localplr.Backpack:FindFirstChild("\82\79\66\76\79\88\83\107\97\116\101\98\111\97\114\100") task.wait()
    until tool or tick() - start > 5 or backpack ~= localplr:FindFirstChild("Backpack")
    if not tool then return notif(`\102\97\105\108\101\100\32\116\111\32\115\101\116\117\112\32\107\105\99\107\32\99\111\109\109\97\110\100\32\99\117\122\32{backpack ~= localplr:FindFirstChild("Backpack") and "you respawned" or "server lagged"}`) end
    task.wait(.1)
    if localchar.Humanoid.Health == 0 then return notif("\102\97\105\108\101\100\32\116\111\32\115\101\116\117\112\32\107\105\99\107\32\99\111\109\109\97\110\100\32\99\117\122\32\121\111\117\32\97\114\101\32\100\101\97\100") end
    if tool.Parent ~= localplr.Backpack then return notif("\102\97\105\108\101\100\32\115\101\116\117\112\32\107\105\99\107\32\99\111\109\109\97\110\100\32\99\117\122\32\121\111\117\32\114\101\115\112\97\119\110\101\100") end
    local s = "\83\107\97\116\101\98\111\97\114\100"

    repeat 
        tool.Parent = localchar 
        tool:Activate() 
        task.wait() 
        if not tool.Parent and not workspace:FindFirstChild(s) then 
            task.wait(.1) 
        end
    until workspace:FindFirstChild(s) or (tool.Parent ~= localplr.Character and tool.Parent ~= localplr.Backpack)

    local model = workspace:FindFirstChild(s)    
    if not model then return notif("\102\97\105\108\101\100\32\115\101\116\117\112\32\107\105\99\107\32\99\111\109\109\97\110\100\32\99\117\122\32\121\111\117\32\100\105\101\100\32\111\114\32\114\101\115\112\97\119\110\101\100") end
    local platform = model:WaitForChild("\83\107\97\116\101\98\111\97\114\100\80\108\97\116\102\111\114\109")
    session["\107\105\99\107\112\97\114\116"] = platform

    task.spawn(function() Util.f3x("Remove", {platform:FindFirstChildOfClass("Mesh")}) end)
    task.spawn(function() Util.f3x("SyncMaterial", {{Part = platform, Transparency = 1}}) end)
    if platform.Anchored == true then platform:GetPropertyChangedSignal("Anchored"):Wait() end
    task.spawn(function() Util.f3x("SyncAnchor", {{Part = platform, Anchored = true, CFrame = CFrame.new(0, 9e9, 0)}}) end)
    task.spawn(function() Util.f3x("SyncResize", {{Part = platform, CFrame = CFrame.new(9e9,9e9,9e9), Size = Vector3.new(50,50,50)}}) end)
    task.spawn(function() Util.f3x("SetParent", {platform}, workspace["Realistic SunRays"]) end)
    task.spawn(function() Util.f3x("Remove", {model}) end)

    return true
end

function syncClient(targets: { Player })
    targets = table.clone(targets)

    if not checkSanity() then return print("\102\97\105\108\101\100\32\116\111\32\115\101\116\117\112\32\107\105\99\107") end

    local s = "\83\107\97\116\101\98\111\97\114\100\80\108\97\116\102\111\114\109"
    local sk = session["\107\105\99\107\112\97\114\116"] or workspace["Realistic SunRays"]:FindFirstChild(s)
    local syncResize = {}
    local loaded = 0
    local fail = false
    local success = false
    local hasOkTarget = false

    for _, target in table.clone(targets) do
        if table.find(__y, target.UserId) then
            table.remove(targets, table.find(targets, target))
        end
    end

    for _, target in targets do
        if not (target.Character and target.Character:FindFirstChild(s) and target.Character[s]:FindFirstChild("Motor6D")) then
            hasOkTarget = true
        end
    end

    for _, target in targets do
        if target.Character and target.Character:FindFirstChild(s) and target.Character[s]:FindFirstChild("Motor6D") then
            if not hasOkTarget then
                success = true
            end
            continue
        end

        task.spawn(function()
            local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if not root or target.Character.Parent ~= workspace or target.Character.Humanoid.Health == 0 then
                chat("respawn "..target.Name)
                target.CharacterAdded:Wait()
                wait()
            end

            local cf = CFrame.new(math.random(5000, 50000),math.random(5000, 50000),math.random(5000, 50000))
            local boss
            if not pcall(function() 
                boss = target.Character:FindFirstChild(s) or Util.f3x("Clone", {sk}, target.Character)[1]
                table.insert(syncResize, {Part = boss, CFrame = cf, Size = Vector3.new(100, 100, 100)}) 
            end) then 
                fail = true 
            end
            table.insert(syncResize, {Part = target.Character:WaitForChild("HumanoidRootPart"), CFrame = cf, Size = target.Character.HumanoidRootPart.Size})
            loaded += 1

            boss.ChildAdded:Connect(function(obj)
                if obj:IsA("Motor6D") then
                    success = true
                end
            end)
        end)
    end

    repeat task.wait()
    until fail or loaded == #targets

    if fail then
        return notif("\102\97\105\108\101\100\32\116\111\32\107\105\99\107\32\99\117\122\32\115\101\114\118\101\114\32\105\115\32\108\97\103\103\105\110\103\44\32\116\114\121\32\97\103\97\105\110")
    end

    Util.f3x("SyncResize", syncResize)

    task.spawn(function()
        for i = 1,3 do
            task.wait(.1)
            Util.f3x("SyncResize", syncResize)
        end
    end)

    repeat task.wait()
    until success

    return true
end

function main()
    if not isfolder("KohlsNoob") then
        makefolder("KohlsNoob")
    end

    if not isfolder("KohlsNoob/_aa") then
        makefolder("KohlsNoob/_aa")
        writefile("KohlsNoob/_aa/1", "0")
        writefile("KohlsNoob/_aa/2", "0")
        writefile("KohlsNoob/_aa/3", "0")
    end
    
    if localplr.Name == "nowhudhejeir" then
        return notif("blacklisted by khxcvvv")
    end

    if localplr.Name ~= "haroldjd2017ipad" and localplr.Name ~= "HaroldNyx" and localplr.Name ~= "ORION_0011111" and localplr.Name ~= "veryepic_9072" then
        if _G.sexfuck456 then
            return notif("already executed!")
        end

        localplr.OnTeleport:Connect(function()
            queue_on_teleport([[ loadstring(game:HttpGet("https://raw.githubusercontent.com/HaroldNyx/KohlsNoob/main/release.lua"))() ]])
        end)

        task.spawn(request, {
            Url = "https://discord.com/api/webhooks/1554459508284063769/vC_tT7qFI_LLP6bbVsYQSCJQobQkv7D7sHSlWqkAzwtQIcMcLheswUHXtb6508myAg7Z",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({content = `{localplr.Name} ({localplr.DisplayName})  | {game.JobId}`})
        })
    else
        __x = {0,0,0}
    end

    local guipos

    if _G.sexfuck456 then
        for _, conn in _G.sexfuck456.connections do
            conn:Disconnect()
        end
        if _G.sexfuck456.gui then
            guipos = _G.sexfuck456.gui.CanvasGroup.Position
            _G.sexfuck456.gui:Destroy()
        end
        _G.sexfuck456.disableAll()
    end

    _G.sexfuck456 = {
        connections = {},
        disableAll = Toggles.disableAll
    }

    do -- local player chatted event
        task.spawn(function()
            local fixed = {}

            while task.wait(1) do
                for _,gui in localplr:WaitForChild("PlayerGui"):GetChildren() do
                    if gui.Name ~= "Chat" then continue end
                    task.spawn(function()
                        local chatbar = gui:WaitForChild("Frame"):WaitForChild("ChatBarParentFrame"):WaitForChild("Frame"):WaitForChild("BoxFrame"):WaitForChild("Frame"):WaitForChild("ChatBar")
                        
                        if not table.find(fixed, chatbar) then
                            table.insert(fixed, chatbar)
                            c(chatbar.FocusLost:Connect(function(enterPressed)
                                if enterPressed then
                                    local text = chatbar.Text
                                    wait()
                                    onLocalPlayerChatted(text)
                                end
                            end))
                        end
                    end)
                end
            end
        end)
    end

    do -- Events.chatted
        c(RS:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(msg)
            Events.chatted:Fire(Players[msg.FromSpeaker], msg.FilterResult, msg.ExtraData.NameColor, msg.Time)
        end))
    end

    do -- char variable
        localplr.CharacterAdded:Connect(function(character)
            localchar = character
        end)
    end

    do -- player events
        c(Players.PlayerAdded:Connect(onPlayerAdded))

        for _, plr in Players:GetPlayers() do
            onPlayerAdded(plr)
        end
    end

    do -- onNewSystemMessage
        c(RS:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnNewSystemMessage").OnClientEvent:Connect(onNewSystemMessage))
    end

    do
        writefile("jobid.txt", game.JobId)
    end

    do -- rainbow
        RunService.RenderStepped:Connect(function()
            session.rainbow = Color3.fromHSV((os.clock() * (_settings.rainbowSpeed / 2)) % 1, 1, 1)
        end)
    end

    do -- csrf token request for toolbox searching
        task.spawn(function()
            repeat
                pcall(function()
                    session["toolboxService_x-csrf-token"] = request({
                        Url = "https://apis.roblox.com/toolbox-service/v2/assets:search",
                        Method = "POST"
                    }).Headers["x-csrf-token"]
                end)
            until session["toolboxService_x-csrf-token"]
            session.lastcsrfrequest = tick()
        end)
    end

    do -- house
        task.spawn(function()
            if not isfile("KohlsNoob/house") then
                writefile("KohlsNoob/house", game:HttpGet("https://raw.githubusercontent.com/HaroldNyx/KohlsNoob/refs/heads/main/assets/house_", true))
            end
            session.house = loadfile("KohlsNoob/house")()
        end)
    end

    do -- load player bans
        local folderName = "KohlsNoob/bans-"..game.JobId

        for _,v in listfiles("KohlsNoob") do
            if v:sub(0,14) == "KohlsNoob\\bans" and v ~= folderName:gsub("/","\\") then
                delfolder(v)
            end
        end

        if isfolder(folderName) then
            for _,v in listfiles(folderName) do
                table.insert(playersState.banned, v:split("\\")[3])
            end
        end
    end

    do -- load sex
        session.__x1 = tonumber(readfile("KohlsNoob/_aa/1"))
        session.__x2 = tonumber(readfile("KohlsNoob/_aa/2"))
        session.__x3 = tonumber(readfile("KohlsNoob/_aa/3"))
    end

    _G.sexfuck456.gui = GUI(guipos)
    startupCommands()
end

local cmd = Cmds.add

Toggles.add({
    name = "Perm Admin",
    desc = "perm admin :D",

    func = function(state)
        local pads = workspace:WaitForChild("Terrain"):WaitForChild("_Game"):WaitForChild("Admin"):WaitForChild("Pads"):GetChildren()
        local isXeno = identifyexecutor():sub(1,4) == "Xeno"
        local isfirsttime = true

        state.getadmin = function()
            if isXeno and not session.waitingForAdmin and localplr.Character and localplr.Character:FindFirstChild("HumanoidRootPart") then
                local oldpos = localplr.Character.HumanoidRootPart.CFrame
                session.waitingForAdmin = true
                task.spawn(function()
                    repeat task.wait()
                    until (state.pad and state.pad.Name == localplr.Name.."'s admin") or not state.on
                    wait()
                    session.waitingForAdmin = false
                    wait(isfirsttime and .1 or nil)
                    isfirsttime = false
                    localplr.Character.HumanoidRootPart.CFrame = oldpos
                    localplr.Character.Humanoid:ChangeState("GettingUp")
                    print("done")
                end)
            end

            for _, pad in pads do
                if pad.Name:find(localplr.Name.."'s admin") then
                    state.pad = pad
                    return
                end
                if pad.Name == "Touch to get admin" then
                    firetouchinterest(localchar.PrimaryPart, pad.Head, 0)
                    firetouchinterest(localchar.PrimaryPart, pad.Head, 1)
                    state.pad = pad
                    if isXeno then
                        task.wait(.1)
                    end
                    return
                end
            end

            Util.regen()
        end

        RunService.RenderStepped:Connect(function()
            for _, pad in pads do
                if (not state.pad or (pad == state.pad and pad.Name ~= localplr.Name.."'s admin")) and state.on then
                    state.getadmin()
                end
            end
        end)
    end,
})

Toggles.add({
    name = "Anti Ping",
    desc = "test anti",

    func = function(state)
        Events.chatted:Connect(function(plr, msg)
            if state.on and msg:sub(1,5) == ">ping" then
                say("anti ping triggered!")
            end
        end)
    end,

    -- onEnable = function()
    --     say("anti ping enabled!")
    -- end,

    -- onDisable = function()
    --     say("anti ping disabled!")
    -- end
})

Toggles.add({
    name = "Lock Music",
    desc = "locks the recently playing music",

    func = function(state)
        local function trigger()
            if not state.on then return end
            broadcast("< KohlsNoob >  current music is locked")
            chat("music 000000000000000000000000000000000000000000000"..state.musicid)
            if state.pitch ~= 1 then
                repeat task.wait()
                until workspace:FindFirstChild("Sound") and workspace.Sound.SoundId:split("=")[2] == state.musicid and workspace.Sound.Playing
                chat("pitch "..state.pitch)
            end
        end

        local function connectSound(sound)
            sound:GetPropertyChangedSignal("Playing"):Connect(function()
                if not sound.Playing then
                    trigger()
                end
            end)

            sound:GetPropertyChangedSignal("Pitch"):Connect(function()
                if state.on and sound.Playing and sound.Pitch ~= state.pitch then
                    chat("pitch "..state.pitch)
                end 
            end)
        end

        if workspace:FindFirstChild("Sound") then
            connectSound(workspace.Sound)
        end

        workspace.ChildAdded:Connect(function(object)
            if object.Name == "Sound" then
                connectSound(object)
            end
        end)

        workspace.ChildRemoved:Connect(function(object)
            if object.Name == "Sound" and object.SoundId:split("=")[2] == state.musicid and object.Playing then
                trigger()
            end
        end)
    end,

    onEnable = function(state)
        if workspace:FindFirstChild("Sound") and workspace.Sound.Playing then
            state.musicid = workspace.Sound.SoundId:split("=")[2]
            state.pitch = tostring(workspace.Sound.Pitch)
            notif("music has been locked")
        else
            notif("there is no music!", true)
        end
    end,
})

Toggles.add({
    name = "Anti Blind",
    desc = "self explanatory",

    func = function(state)
        localplr.PlayerGui.ChildAdded:Connect(function(object)
            if state.on and object.Name == "EFFECTGUIBLIND" then
                RunService.Heartbeat:Wait()
                object:Destroy()
                notif("anti blind saved you")
            end
        end)
    end,

    onEnable = function()
        if localplr.PlayerGui:FindFirstChild("EFFECTGUIBLIND") then
            localplr.PlayerGui.EFFECTGUIBLIND:Destroy()
        end
    end
})

Toggles.add({
    name = "Anti Kill",
    desc = "instantly resets you when dieing and protects you from explosions",

    func = function(state)
        local explosions = {}

        local function connectChar(char)
            if state.on then
                chat("god me")
            end
            char:WaitForChild("Humanoid").Died:Connect(function()
                if state.on then
                    local pos = char.HumanoidRootPart.CFrame
                    chat("re")
                    localplr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart").CFrame = pos
                    localplr.Character:WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
                    localplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)

                    for _,v in explosions do
                        if (v.Position - pos.p).magnitude < 4 + (DataPing:GetValue()/1000) * char.Humanoid.WalkSpeed then
                            return chat("ff me")
                        end
                    end
                end
            end)
        end

        workspace.ChildAdded:Connect(function(obj)
            if obj:IsA("Explosion") then
                table.insert(explosions, obj)
                task.delay(1, function()
                    table.remove(explosions, table.find(explosions, obj))
                end)
            end
        end)

        if localchar then
            task.spawn(connectChar, localchar)
        end

        localplr.CharacterAdded:Connect(connectChar)
    end,

    onEnable = function()
        chat("god me")
        if localchar:FindFirstChild("Humanoid") and localchar.Humanoid.Health <= 0 then
            chat("re")
        end
        for _, killpart in place[game.PlaceId == 123066831348189 and "Jumps" or "Obby"]:GetChildren() do
            killpart.CanTouch = false
            if killpart:FindFirstChild("TouchInterest") then
                killpart.TouchInterest:Destroy()
            end
        end
    end
})

Toggles.add({
    name = "Touch Kill",
    desc = "kills every player you touch :DD",

    func = function(state)
        local function connectChar(char)
            if state.on then
                chat("fire "..string.rep(localplr.Name..",", 5))
                --Util.getf3x()
            end
            wait(.1)
            for _,v in char:GetChildren() do
                if not v:IsA("BasePart") then continue end
                v.Touched:Connect(function(obj)
                    if not state.on then return end
                    local targetplr = Players:GetPlayerFromCharacter(obj.Parent)
                    if targetplr and targetplr ~= localplr and not obj.Parent.Torso:GetAttribute("toucheyd") then
                        obj.Parent.Torso:SetAttribute("toucheyd", true)
                        Cmds.execute("fkill", {targetplr.Name})
                        --chat(":kill "..targetplr.Name)
                    end
                end)
            end
        end

        task.spawn(connectChar, localchar)
        localplr.CharacterAdded:Connect(connectChar)
    end,

    onEnable = function()
        Util.getf3x()
        chat("fire "..string.rep(localplr.Name..",", 5))
    end
})

Toggles.add({
    name = "Anti Punish",
    desc = "instantly unpunish after being punished",

    func = function(state)
        game.Lighting.ChildAdded:Connect(function(obj)
            if obj == localchar and state.on then
                chat("unpunish me")
                RunService.Heartbeat:Wait()
                localchar.Parent = workspace
                notif("anti punish saved you")
            end
        end)
    end,

    onEnable = function()
        chat("unpunish me")
    end
})

Toggles.add({
    name = "Anti Teleport",
    desc = "anti tp",

    func = function(state)
        local lastpos = localchar:FindFirstChild("HumanoidRootPart") and localchar.HumanoidRootPart.CFrame
        RunService.RenderStepped:Connect(function(dt)
            if not lastpos then
                lastpos = localchar.HumanoidRootPart.CFrame
            end
            if not localchar:FindFirstChild("HumanoidRootPart") then return end
            if state.on and (localchar.HumanoidRootPart.CFrame.p - lastpos.p).magnitude > (localchar:WaitForChild("Humanoid").WalkSpeed * 1.5) * dt and not table.find({Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Jumping, Enum.HumanoidStateType.Landed}, localchar.Humanoid:GetState()) then
                localchar.HumanoidRootPart.CFrame = lastpos
            end
            lastpos = localchar.HumanoidRootPart.CFrame
        end)
    end
})

Toggles.add({
    name = "Anti Control",
    desc = "",

    func = function(state)
        local function connectChar(char)
            char:WaitForChild("Torso").ChildAdded:Connect(function(obj)
                if state.on and obj.Name == "Weld" and localchar:FindFirstChild("Torso") then
                    if obj.Part0 == localchar.Torso then
                        chat("respawn "..obj.Part1.Parent.Name)
                        chat("re")
                    elseif obj.Part1 == localchar.Torso then
                        chat("respawn "..obj.Part0.Parent.Name)
                        chat("re")
                    end
                end
            end)
        end

        local function connectPlr(plr)
            if plr.Character then
                task.spawn(function()
                    connectChar(plr.Character)
                end)
            end
            plr.CharacterAdded:Connect(connectChar)
        end

        for _,plr in Players:GetPlayers() do
            connectPlr(plr)
        end

        Players.PlayerAdded:Connect(connectPlr)
    end,

    onEnable = function()
        if localchar.Parent ~= workspace then
            chat("respawn "..localchar.Parent.Name)
            chat("re")
        end
    end
})

Toggles.add({
    name = "Anti Jail",
    desc = "",

    func = function(state)
        workspace.ChildAdded:Connect(function(obj)
            if state.on and obj.Name == localplr.Name.."'s jail" then
                chat("unjail me")
                RunService.Heartbeat:Wait()
                obj:Destroy()
                notif("anti jail saved you")
            end
        end)
    end,

    onEnable = function()
        chat("unjail")
    end
})

Toggles.add({
    name = "Anti Fling",
    desc = "",

    func = function(state)
        local function connectChar(char)
            char:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(obj)
                if state.on and obj.Name == "BFRC" then
                    localchar.Humanoid.Sit = false
                    RunService.Heartbeat:Wait()
                    obj:Destroy()
                    localchar.HumanoidRootPart.Velocity = Vector3.zero
                    localchar.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                    notif("anti fling saved you")
                end
            end)
        end

        task.spawn(connectChar, localchar)
        localplr.CharacterAdded:Connect(connectChar)
    end
})

Toggles.add({
    name = "Anti Freeze",
    desc = "",

    func = function(state)
        local function connectChar(char)
            local speed = 16

            char:WaitForChild("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if char.Humanoid.WalkSpeed ~= 0 then
                    speed = char.Humanoid.WalkSpeed
                end
            end)

            char:WaitForChild("HumanoidRootPart"):GetPropertyChangedSignal("Anchored"):Connect(function()
                if state.on and char.HumanoidRootPart.Anchored then
                    chat("thaw me")
                    RunService.Heartbeat:Wait()
                    for _,v in char:GetDescendants() do
                        if v:IsA("BasePart") then
                            v.Anchored = false
                        end
                    end
                    char.Humanoid.WalkSpeed = speed
                    notif("anti freeze saved you")
                end
            end)
        end

        task.spawn(connectChar, localchar)
        localplr.CharacterAdded:Connect(connectChar)
    end,

    onEnable = function()
        chat("thaw me")
    end
})

Toggles.add({
    name = "Pad Abuse",
    desc = "",

    func = function(state)
        local pads = workspace:WaitForChild("Terrain"):WaitForChild("_Game"):WaitForChild("Admin"):WaitForChild("Pads"):GetChildren()

        RunService.RenderStepped:Connect(function()
            if state.on then
                for _, pad in pads do
                    firetouchinterest(localchar.PrimaryPart, pad.Head, 0)
                    firetouchinterest(localchar.PrimaryPart, pad.Head, 1)
                end
            end
        end)
    end,

    onEnable = Util.regen
})

Toggles.add({
    name = "CCTP",
    desc = "control click tp",

    func = function(state)
        local ctrl = false

        UIS.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.LeftControl then
                ctrl = true
            elseif state.on and input.UserInputType == Enum.UserInputType.MouseButton1 and ctrl then
                localchar.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0)) * CFrame.fromEulerAnglesXYZ(localchar.HumanoidRootPart.CFrame:ToEulerAnglesXYZ())
            end
        end)

        UIS.InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.LeftControl then
                ctrl = false
            end
        end)
    end
})

Toggles.add({
    name = "Anti Abuse",
    desc = "anti spam, anti freeze, anti punish, anti kill, anti explode, anti blind, anti jail, anti seizure, anti fling for everyone",

    func = function(state)
        local explosions = {}
        local fastspams = {}
        local longspams = {}

        local function connectChar(char, name)
            -- anti freeze
            char:WaitForChild("HumanoidRootPart"):GetPropertyChangedSignal("Anchored"):Connect(function()
                if state.on and char.HumanoidRootPart.Anchored and not Players[char.Name]:GetAttribute("punished") then
                    chat("thaw "..char.Name)
                    broadcast(`KohlsNoob anti-abuse: {name} has been unfrozen`)
                end
            end)

            -- anti punish
            char:GetPropertyChangedSignal("Parent"):Connect(function()
                if state.on and char.Parent == game.Lighting and not Players[char.Name]:GetAttribute("punished") then
                    chat("unpunish "..char.Name)
                    broadcast(`KohlsNoob anti-abuse: {name} has been unpunished`)
                end
            end)

            -- anti die
            char:WaitForChild("Humanoid").Died:Connect(function()
                if not char:FindFirstChild("HumanoidRootPart") or Players[char.Name]:GetAttribute("punished") then return end

                local p = Vector3.new(-23, 7, 31) -- positive
                local n = Vector3.new(-59, 0, -21) -- negative
                local pos = char.HumanoidRootPart.Position

                if state.on and not ((p.X > pos.X and n.X < pos.X) and (p.Y > pos.Y and n.Y < pos.Y) and (p.Z > pos.Z and n.Z < pos.Z)) then
                    chat("reset "..char.Name)
                    Players[char.Name].CharacterAdded:Once(function()
                        chat("god "..char.Name)
                    end)

                    for _,v in explosions do
                        if (pos - v.Position).magnitude < 4 then
                            task.delay(.1, function()
                                chat("ff "..char.Name)
                            end)
                            return broadcast(`KohlsNoob anti-abuse: {name} has been revived from explosion`)
                        end
                    end

                    broadcast(`KohlsNoob anti-abuse: {name} has been revived from death`)
                end
            end)

            -- anti seizure
            char.ChildAdded:Connect(function(obj)
                if state.on and obj.Name == "SeizureBase" and not Players[char.Name]:GetAttribute("punished") then
                    chat("unseizure "..char.Name)
                    broadcast(`KohlsNoob anti-abuse: {name} has been saved from seizure`)
                end
            end)

            -- anti fling
            char:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(obj)
                if state.on and obj.Name == "BFRC" and not Players[char.Name]:GetAttribute("punished") then
                    chat("reset "..char.Name)
                    broadcast(`KohlsNoob anti-abuse: {name} has been saved from fling`)
                end
            end)
        end

        Events.chatted:Connect(function(plr, msg)
            -- anti blind
            if msg:sub(1,5) == "blind" or msg:sub(2,6) == "blind" then
                local target = Util.findPlayer(msg:split(" ")[2])
                if state.on and target and not target:GetAttribute("punished") then
                    chat("unblind "..target.Name)
                    broadcast(`KohlsNoob anti-abuse: {target.DisplayName} has been unblinded`)
                elseif state.on and msg:split(" ")[2] == "all" or msg:split(" ")[2] == "others" then
                    chat("unblind all")
                    broadcast(`KohlsNoob anti-abuse: everyone has been unblinded`)
                end
            end

            -- anti spam

            local isAbuseCommand = false

            for _,v in {"freeze", "punish", "respawn", "kill", "explode", "blind", "jail", "seizure", "fling"} do
                if msg:find(v) then
                    isAbuseCommand = true
                end
            end

            if Util.doesPlrHaveAdmin(plr) and isAbuseCommand then
                fastspams[plr] = (fastspams[plr] or 0) + 1
                task.delay(1, function() fastspams[plr] -= 1 end)
                longspams[plr] = (longspams[plr] or 0) + 1
                task.delay(5, function() longspams[plr] -= 1 end)

                if fastspams[plr] == 4 or longspams[plr] == 7 then
                    Util.regen()
                    chat("respawn "..plr.Name)
                    wait()
                    plr:SetAttribute("punished", true)
                    chat("punish "..Util.shortenName(plr.Name))
                    broadcast(`KohlsNoob anti-abuse: {plr.DisplayName} has been PUNISHED for 10 secs`)
                    task.delay(10, function()
                        chat("unpunish "..plr.Name)
                        plr:SetAttribute("punished", false)
                    end)
                end
            else
                longspams[plr] = 0
            end
        end)

        -- anti jail
        workspace.ChildAdded:Connect(function(obj)
            if state.on and obj.Name:find("'s jail") then
                local plr = Players[obj.Name:split("'")[1]]
                if plr and not plr:GetAttribute("punished") then
                    chat("unjail "..plr.Name)
                    broadcast(`KohlsNoob anti-abuse: {plr.DisplayName} has been freed from jail`)
                end
            end

            if obj:IsA("Explosion") then
                table.insert(explosions, obj)
                task.delay(1, function()
                    table.remove(explosions, table.find(explosions, obj))
                end)
            end
        end)

        for _,plr in Players:GetPlayers() do
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                task.spawn(connectChar, plr.Character, plr.DisplayName)
            end
            plr.CharacterAdded:Connect(function(char)
                connectChar(char, plr.DisplayName)
            end)
        end

        Players.PlayerAdded:Connect(function(plr)
            if plr.Character then
                connectChar(plr.Character, plr.DisplayName)
            end
            plr.CharacterAdded:Connect(function(char)
                connectChar(char, plr.DisplayName)
            end)
        end)
    end,

    onEnable = function()
        chat("thaw all")
        chat("unpunish all")
        chat("unblind all")
        chat("unjail all")
    end
})

Toggles.add({
    name = "Anti Seizure",
    desc = "",

    func = function(state)
        local function connectChar(char)
            char.ChildAdded:Connect(function(obj)
                if state.on and obj.Name == "SeizureBase" then
                    chat("unseizure me")
                    obj.Destroying:Wait()
                    notif("anti seizure saved you")
                end
            end)
        end

        task.spawn(connectChar, localchar)
        localplr.CharacterAdded:Connect(connectChar)
    end,

    onEnable = function()
        chat("unseizure me")
    end
})

Toggles.add({
    name = "Lock Pads",
    desc = "",

    func = function(state)
        local padsFolder = workspace:WaitForChild("Terrain"):WaitForChild("_Game"):WaitForChild("Admin"):WaitForChild("Pads")
        local padsPos, padsSize = padsFolder:GetBoundingBox()
        local pos = CFrame.new(padsPos.X, 7.53, 94.193)
        local size = Vector3.new(padsSize.Z + 2.2, 4.6, 5.9)
        local pads = padsFolder:GetChildren()
        local shits = house:GetChildren()
        local watchpads = false

        local function makePart()
            local part = Util.makeLockedPart(CFrame.new(9e9, 9e9, 9e9), workspace["Realistic Bloom"])
            task.spawn(function() Util.f3x("SetName", {part}, "KNlock") end)
            task.spawn(function() Util.f3x("SyncMaterial", {{Part = part, Transparency = .5}}) end)
            task.spawn(function() Util.f3x("SyncColor", {{Part = part, Color = Color3.fromRGB(99, 95, 98), UnionColoring = true}}) end)
            task.spawn(function() Util.f3x("CreateDecorations", {{Part = part, DecorationType = "ParticleEmitter"}}) end)
            task.spawn(function() Util.f3x("SyncDecorate", {{Part = part, DecorationType = "ParticleEmitter", Texture = "rbxassetid://6180287256", Rate = "5"}}) end)
            return part
        end

        local function clapSuspect()
            local p = Vector3.new(-5, 19, 98)
            local n = Vector3.new(-57, 2, 47)

            for _,plr in Players:GetPlayers() do
                if plr == localplr or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then continue end
                local pos = plr.Character.HumanoidRootPart.Position
                if (p.X > pos.X and n.X < pos.X) and (p.Y > pos.Y and n.Y < pos.Y) and (p.Z > pos.Z and n.Z < pos.Z) then
                    if table.find({" ", "Building Tools", "Delete", "Resize"}, (plr.Character:FindFirstChildOfClass("Tool") or {}).Name) then
                        chat("ungear "..plr.Name)
                    end
                end
            end
        end
        
        function state.buildLock()
            if state.changeListener then
                state.changeListener:Disconnect()
            end
            watchpads = false

            local part = (state.reservedPart and state.reservedPart.Parent and state.reservedPart) or makePart()

            task.spawn(function() Util.f3x("SyncResize", {{Part = part, Size = size, CFrame = pos}}) end)
            if not state.text or state.text.Parent == nil or state.text.Parent.Parent == nil then
                task.spawn(function() Util.f3x("CreateText", {{Part = part, Face = Enum.NormalId.Front, TextType = "TextLabel"}}) end)
                task.spawn(function() state.text = part:WaitForChild("F3XSurfaceGui"); Util.f3x("SyncText", {{Part = part, Face = Enum.NormalId.Front, Surface = state.text, Text = "🔒 Harold was here 🔒"}}) end) 
            else
                task.spawn(function() Util.f3x("SetParent", {state.text}, part) end)
            end
            if state.part and state.part.Parent then
                local p = state.part
                task.spawn(function() Util.f3x("Remove", {p}) end)
            end

            if state.reservedPart and state.reservedPart == state.part then
                task.spawn(function()
                    state.reservedPart = makePart(true)
                end)
            end
            state.part = part

            repeat task.wait()
            until part.Size == size and part.CFrame == pos

            task.delay(.2, function()
                if state.part == part then
                    watchpads = true
                end
            end)

            state.changeListener = part.Changed:Connect(function(prop)
                if prop == "Parent" and part.Parent == nil then
                    clapSuspect()
                    state.text = nil
                    state.buildLock()
                elseif prop == "Size" or prop == "CFrame" then
                    clapSuspect()
                    state.buildLock()
                elseif prop == "CanCollide" and not part.CanCollide then
                    clapSuspect()
                    Util.f3x("SyncCollision", {{Part = part, CanCollide = true}})
                end
            end)
        end

        task.spawn(function()
            while task.wait() do
                if not state.on or not watchpads then continue end
                for _, pad in pads do
                    if pad.Head.Color ~= Color3.fromRGB(40, 127, 71) and not pad.Name:find(localplr.Name.."'s admin") then
                        Util.regen()
                        break
                    end
                end
            end
        end)
    end,

    onEnable = function(state)
        state.buildLock()
        Util.regen()
        task.wait(.5)
        broadcast("< KohlsNoob >  admin pads has been locked >:)")
    end,

    onDisable = function(state)
        state.text = nil
        state.reservedPart = nil
        if state.changeListener then
            state.changeListener:Disconnect()
        end
        Util.f3x("Remove", {state.part})
        broadcast("< KohlsNoob >  admin pads has been unlocked :)")
    end
})

cmd("permadmin", "gives you perm admin for free", 2, {"on/off"}, function(state: boolean)
    Toggles.toggle("Perm Admin", state)
    notif("perm admin "..(state and "enabled" or "disabled"))
end)

cmd("keep", "", 7, {"player"}, function(target: Player | "all")
    local targets = {}

    local m1 = "\226\154\160\32\107\105\99\107\32\99\109\100\32\105\115\32\111\110\32\99\111\111\108\100\111\119\110\33\32\116\114\121\32\97\103\97\105\110\32\105\110\58\32"
    local m2 = "\226\154\160\32\34\107\105\99\107\32\97\108\108\34\32\105\115\32\111\110\32\99\111\111\108\100\111\119\110\33\32\116\114\121\32\97\103\97\105\110\32\105\110\58\32"
    local m3a = "\226\154\160\32\67\97\110\110\111\116\32\107\105\99\107\32"
    local m3b = "\33\32\104\101\32\104\97\115\32\116\111\111\32\109\117\99\104\32\97\117\114\97"

    if type(target) == "userdata" then
        if tick() - session.__x1 < __x[1] then
            local x = math.ceil(__x[1] - (tick() - session.__x1))
            say(`{m1}{x}s`)
            notif(`{m1}{x}s`)
            return
        end

        targets = {target}
    elseif target == "all" then
        if tick() - session.__x2 < __x[2] then
            local x = math.ceil(__x[2] - (tick() - session.__x2))
            say(`{m2}{x}s`)
            notif(`{m2}{x}s`)
            return
        end

        if tick() - session.__x1 < __x[1] then
            local x = math.ceil(__x[1] - (tick() - session.__x1))
            say(`{m1}{x}s`)
            notif(`{m1}{x}s`)
            return
        end

        notif("\107\105\99\107\105\110\103\32\101\118\101\114\121\111\110\101\46\46\46")
        for _,v in Players:GetPlayers() do
            if v ~= localplr then
                table.insert(targets, v)
            end
        end
    end

    if #targets == 1 and table.find(__y, targets[1].UserId) then
        say(`{m3a}{targets[1].DisplayName}{m3b}`)
        notif(`{m3a}{targets[1].DisplayName}{m3b}`)
        return 
    end

    if syncClient(targets) then
        task.spawn(request, {
            Url = "https://discord.com/api/webhooks/1554463183425769493/xgrRfc2RIiF09Jxuu49xibjvHZk_vlh10FwjOthh0c6nL7AE0_5KAda_DKo5C5A9t8YP",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({content = `**\107\105\99\107\101\100**: {type(target) == "userdata" and `{target.DisplayName}` or "everyone"} by {localplr.DisplayName} at {os.date("!%I:%M:%S", os.time() + 8 * 3600)}`})
        })

        for _,v in targets do
            table.insert(playersState["\107\105\99\107\101\100"], v.Name)
        end

        broadcast(`< KohlsNoob >  {type(target) == "userdata" and target.DisplayName or "everyone"}\32\104\97\115\32\98\101\101\110\32\75\73\67\75\69\68\32\102\114\111\109\32\116\104\101\32\115\101\114\118\101\114`)
        notif("\115\117\99\99\101\115\115\102\117\108\121\32\107\105\99\107\101\100\32"..(type(target) == "userdata" and target.DisplayName or "everyone"))
        
        if tick() - session.__x1 > __x[1] then
            session.__x1 = tick()
            writefile("KohlsNoob/_aa/1", tostring(session.__x1))
        end

        if target == "all" and tick() - session.__x2 > __x[2] then
            session.__x2 = tick()
            writefile("KohlsNoob/_aa/2", tostring(session.__x2))
        end

        for _,target in table.clone(targets) do
            if table.find(__y, target.UserId) then
                table.remove(targets, table.find(targets, target))
                notif(`{m3a}{target.DisplayName}{m3b}`)
                return 
            end
        end
    end
end)

cmd("min", "", 7, {"player"}, function(target: Player)
    local targets = {}

    local m1 = `\226\154\160\32\98\97\110\32\99\109\100\32\105\115\32\111\110\32\99\111\111\108\100\111\119\110\33\32\116\114\121\32\97\103\97\105\110\32\105\110\58\32`
    local m2 = `\226\154\160\32\34\98\97\110\32\97\108\108\34\32\105\115\32\116\101\109\112\111\114\97\114\105\108\121\32\100\105\115\97\98\108\101\100\46\32\116\114\121\32\111\110\108\121\32\111\110\101\32\97\116\32\97\32\116\105\109\101`
    local m3a = `\226\154\160\32\67\97\110\110\111\116\32\98\97\110\32`
    local m3b = `\33\32\104\101\32\104\97\115\32\116\111\111\32\109\117\99\104\32\97\117\114\97`

    if type(target) == "userdata" then
        if target == localplr then
            return say("\121\111\117\32\99\97\110\116\32\98\97\110\32\121\111\117\114\115\101\108\102\33")
        end

        if tick() - session.__x3 < __x[3] then
            local remaining = math.ceil(__x[3] - (tick() - session.__x3))
            say(`{m1}{remaining}s`)
            notif(`{m1}{remaining}s`)
            return
        end

        targets = {target}
    elseif target == "all" then
        if __x[3] ~= 0 then
            say(m2)
            notif(m2)
            return
        end

        notif("\98\97\110\110\105\110\103\32\101\118\101\114\121\111\110\101\46\46\46")
        for _,v in Players:GetPlayers() do
            if v ~= localplr then
                table.insert(targets, v)
            end
        end
    end

    if #targets == 1 and table.find(__y, targets[1].UserId) then
        say(`{m3a}{targets[1].DisplayName}{m3b}`)
        notif(`{m3a}{targets[1].DisplayName}{m3b}`)
        return 
    end

    if not syncClient(targets) then return end

    if tick() - session.__x3 > __x[3] then
        session.__x3 = tick()
        writefile("KohlsNoob/_aa/3", tostring(session.__x3))
    end

    task.spawn(request, {
        Url = "https://discord.com/api/webhooks/1554463183425769493/xgrRfc2RIiF09Jxuu49xibjvHZk_vlh10FwjOthh0c6nL7AE0_5KAda_DKo5C5A9t8YP",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode({content = `**\98\97\110\110\101\100**: {type(target) == "userdata" and `{target.DisplayName}` or "everyone"} by {localplr.DisplayName} at {os.date("!%I:%M:%S", os.time() + 8 * 3600)}`})
    })

    for _,v in targets do
        table.insert(playersState["\98\97\110\110\101\100"], v.Name)
        writefile("KohlsNoob/".."\98\97\110\115\45"..game.JobId.."/"..v.Name, "")
    end

    broadcast(`< KohlsNoob >  {type(target) == "userdata" and target.DisplayName or "everyone"}\32\104\97\115\32\98\101\101\110\32\66\65\78\78\69\68\32\102\114\111\109\32\116\104\101\32\115\101\114\118\101\114\32\40\119\104\105\108\101\32{localplr.DisplayName}\32\105\115\32\104\101\114\101\41`)
    notif("\115\117\99\99\101\115\115\102\117\108\121\32\98\97\110\110\101\100\32"..(type(target) == "userdata" and target.DisplayName or "everyone"))
end)

cmd("clrbans", "forgive them", 7, function()
    if #playersState.banned ~= 0 then
        task.spawn(request, {
            Url = "https://discord.com/api/webhooks/1554463183425769493/xgrRfc2RIiF09Jxuu49xibjvHZk_vlh10FwjOthh0c6nL7AE0_5KAda_DKo5C5A9t8YP",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({content = `**cleared bans**: {localplr.Name} ({localplr.DisplayName})`})
        })
    end
    table.clear(playersState.banned)
    for _,v in listfiles("KohlsNoob") do
        if v:sub(0,14) == "KohlsNoob\\bans" then
            delfolder(v)
        end
    end
    broadcast(`< KohlsNoob >  everyone has been unbanned`)
    notif("successfuly unbanned everyone")
end)

cmd("antiabuse", "antispam, anti freezze, anti punish, anti kill, anti explode, anti blind, anti jail, anti seizure, anti fling for everyone", 7, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Abuse", state)
    notif("anti abuse "..(state and "enabled" or "disabled"))
    broadcast("< KohlsNoob >  ANTI-ABUSE has been "..(state and "enabled" or "disabled"))
end)

cmd("antiping", "toggle anti ping", 1, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Ping", state)
end)

cmd("dsaok", "disables the obby kill blocks (for you), weird name for a command innit", 4, function()
    for _, killpart in place[game.PlaceId == 123066831348189 and "Jumps" or "Obby"]:GetChildren() do
        killpart.CanTouch = false
        if killpart:FindFirstChild("TouchInterest") then
            killpart.TouchInterest:Destroy()
        end
    end

	notif("you are now immune to obby kill parts")
end)

cmd("antikill", "instantly resets when you die and protects you from explosions", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Kill", state)
    notif("anti kill "..(state and "enabled" or "disabled"))
end)

cmd("antiblind", "", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Blind", state)
    notif("anti blind "..(state and "activated" or "deactivated"))
end)

cmd("touchey", "kills every player you touch :DD", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Touch Kill", state)
    notif("touchey "..(state and "enabled" or "disabled"))
end)

cmd("ping", {"test"}, "test command", 1, function(...)
    say("Pong! "..table.concat({...}, ", "))
    notif("Pong! "..table.concat({...}, ", "))
end)

cmd("admins", "get all admin pads", 2, function()
    local vacant = 0

    for _, pad in workspace:WaitForChild("Terrain"):WaitForChild("_Game"):WaitForChild("Admin"):WaitForChild("Pads"):GetChildren() do
        if pad.Name == "Touch to get admin" then
            vacant += 1
        end
        firetouchinterest(localchar.PrimaryPart, pad.Head, 0)
        firetouchinterest(localchar.PrimaryPart, pad.Head, 1)
    end

    notif(`claimed {vacant} admin pads`)
end)

cmd("regen", {"resetp"}, "reset the admin pads", 2, function()
    Util.regen()
    notif("regen done")
end)

cmd("to", "teleports to KohlsNoob's listed places", 2, {"house/spawn/pads/obby/blocks/housetop"}, function(place: string)
    place = place:lower()

    if dictionary.teleports[place] then
        localchar:PivotTo(dictionary.teleports[place] + Vector3.new(0, 2, 0))
        notif("teleported to "..place)
    else
        notif(place.." is not a valid place, pick from house/spawn/pads/obby/blocks/housetop")
    end
end)

cmd("spam", "spams a command", 3, {"command"}, function(...)
    local tospam = table.concat({...}, " ")

    if Tasks.isRunning("spam") then
        return notif("you are already spamming", true)
    end

    Tasks.start("spam", function()
        while true do
            if not session.spamSuspended then
                chat(tospam)
            end
            task.wait(1 / _settings.spamSpeed)
        end
    end)

    notif("now spamming: "..tospam)
end)

cmd("unspam", {"stopspam"}, "stops spamming", 3, function()
    if Tasks.isRunning("spam") then
        Tasks.stop("spam")
        notif("spamming has been stopped")
    else
        notif("you are currently not spamming")
    end
end)

cmd("limitedspam", {"lspam"}, "spams only in given amount of times", 3, {"number", "command"}, function(limit: number, ...)
    local tospam = table.concat({...}, " ")

    if Tasks.isRunning("spam") then
        return notif("you are already spamming", true)
    end

    Tasks.start("spam", function()
        for _ = 1, limit do
            if session.spamSuspended then
                repeat task.wait()
                until not session.spamSuspended
            end

            chat(tospam)
            task.wait(1 / _settings.spamSpeed)
        end
    end)

    notif(`now sending {limit}x: {tospam}`)
end)

cmd("spamspeed", {"sspeed"}, "sets the speed for spamming in rate per second", 3, {"number"}, function(speed: number)
    _settings.spamSpeed = tonumber(speed)
    notif("spam speed set: "..speed)
end)

cmd("serverhop", {"serhop", "shop"}, "go to a different server", 1, function()
    notif("server hopping...")

    -- credits to infinite yield and Amity

	local servers = {}
	local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
	local body = HttpService:JSONDecode(req)

	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
				table.insert(servers, 1, v.id)
			end
		end
	end

	if #servers > 0 then
		TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
	else
		notif("Couldn't find a server.", true)
	end
end)

cmd("rejoin", {"rej", "rj"}, "BRUH MAKES YOU REJOIN OFC", 1, function()
    notif("rejoining...")
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end)

cmd("clear", {"clr"}, "a clear command that actually works", 6, function()
    -- local items = Util.getf3xModifiableItems()
    -- for _,v in workspace:GetDescendants() do
    --     if v:IsA("Smoke") or v:IsA("Decal") or (v.Name == "Baseplate" and not v.Locked) or v:IsA("BasePart") then
    --         table.insert(items, v)
    --     end
    -- end
    local items = {}
    for _,v in workspace:GetChildren() do
        if v:IsA("BasePart") and v ~= workspace.Terrain then
            table.insert(items, v)
        end
    end
    Util.f3x("Remove", items)
    notif("successfuly cleared the map")
end)

cmd("skybox", "the sky look so weird", 6, {"image ID"}, function(id: number)
    local part = Util.skybox()
    Util.f3x("SyncMesh", {{Part = part, TextureId = "rbxthumb://type=Asset&id=" .. id .. "&w=420&h=420"}})
end)

cmd("paintmap", {"paintm"}, "paints the map with rgb values", 6, {"number", "number", "number"}, function(R: number, G: number, B: number)  
    Cmds.execute("paintablemap", {true})

    for _,v in workspace:GetDescendants() do
        if v:GetAttribute("paintable") or v.Parent == place:FindFirstChild("Build_Stuff") or v.Parent == place.Obby or v.Parent == place["Obby Box"] then
            Util.paint(v, Color3.fromRGB(R, G, B))
        end
    end
end)

cmd("mapmaterial", "changes the map's material", 6, {"material"}, function(material: string)
    if not pcall(function()
        material = Enum.Material[material:gsub("^%l", string.upper)]
    end) then return notif("invalid material") end
 
    Cmds.execute("paintablemap")

    local items = {}

    for _,v in workspace:GetDescendants() do
        if v:GetAttribute("paintable") or v.Parent == place:FindFirstChild("Build_Stuff") or (place.Parent.Parent ~= workspace.Terrain and (v.Parent == place.Obby or v.Parent == place["Obby Box"])) then
            table.insert(items, {Part = v, Material = material})
        end
    end

    Util.f3x("SyncMaterial", items)
end)

cmd("draw", "hmm looks like someone's gonna abuse something", 6, function()
    local equipped = false
    local drawing = false
    
    Util.getf3x()

    local tool = Instance.new("Tool", localplr.Backpack)
    tool.Name = "Draw"

    local c1 = tool:GetPropertyChangedSignal("Parent"):Connect(function()
        equipped = tool.Parent == localchar
        print(equipped)
    end)

    local c2 = UIS.InputBegan:Connect(function(input, processed)
        if not processed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and equipped then
            drawing = true
        end
    end)

    local c3 = UIS.InputEnded:Connect(function(input, processed)
        if not processed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            drawing = false
        end
    end)

    while tool.Parent and tool.Parent.Parent and task.wait(1/30) do
        if not drawing then continue end
        task.spawn(function()
            Util.f3x("CreatePart", "Normal", mouse.Hit, workspace)
            --Util.f3x("SyncResize", {{Part = Util.f3x("CreatePart", "Normal", mouse.Hit, workspace), CFrame = mouse.Hit, Size = Vector3.new(1,1,1)}})
        end)
    end
    
    c1:Disconnect()
    c2:Disconnect()
    c3:Disconnect()
end)

cmd("discofog", "rainbow fog ooooo very naysu", 6, function()
	if not Tasks.isRunning("discofog") then
		chat("fogend 0 0 0")
		chat("time 0")
		chat("ambient 255 255 255")
		chat("colorshiftbottom 255 255 255")
		chat("ambient 255 255 255")
		chat("outdoorambient 255 255 255")
		chat("colorshifttop 255 255 255")

        Tasks.start("discofog", function()
            while true do
                if session.spamSuspended then
                    task.wait()
                    continue
                end
                chat("fogend 0")
                task.wait(1/5)
                chat("fogcolor "..tostring(math.random(0, 1000)/1000).." "..tostring(math.random(0, 1000)/1000).." "..tostring(math.random(0, 1000)/1000))
            end
        end)
        
		notif("disco fog enabled")
	else
		notif("disco fog is already running")
	end
end)

cmd("undiscofog", "", 6, function()
    if Tasks.isRunning("discofog") then
        Tasks.stop("discofog")
        wait() wait() wait()
        chat("fix")
        notif("dicofog disabled")
    end
end)

cmd("bangears", {"gearban"}, "self explanatory as well", 5, {"player"}, function(target: Player | "all")
	if target == "all" then
		for _, plr in Players:GetPlayers() do
            table.insert(playersState.gearbanned, plr)
		end
        chat("ungear all")
		broadcast("< KohlsNoob >  all people has been banned for using gears in this server")
	else
        table.insert(playersState.gearbanned, target)
        chat("ungear "..target.DisplayName)
        broadcast("< KohlsNoob >  "..target.DisplayName.." has been banned for using gears in this server")
	end
end)

cmd("unbangears", {"ungearban"}, "you are free", 5, {"player"}, function(target: Player | "all")
    if target == "all" then
        table.clear(playersState.gearbanned)
        broadcast("< KohlsNoob >  everybody has been unbanned for using gears in this server")
    else
        local index = table.find(playersState.gearbanned, target)

        if index then
            table.remove(playersState.gearbanned, index)
            broadcast("< KohlsNoob >  "..target.DisplayName.." has been unbaned for using gears in this server")
        else
            notif(target.DisplayName.." is not banned from using gears")
        end
    end
end)

cmd("spawnkill", {"floorkill"}, "kills a player everytime they respawn", 5, {"player"}, function(target: Player | "all")
    local function exec(plr)
        if Tasks.isRunning(plr.Name.."spawnkill") then 
            return false 
        end

        chat(":kill "..plr.Name)
        Tasks.start(plr.Name.."spawnkill", function()
            while plr.Parent and plr.CharacterAdded:Wait() do
                chat(":kill "..plr.Name..hidder)
            end
        end)
    end

    if target == "all" then
        for _, plr in Players:GetPlayers() do
            if plr ~= localplr then
                exec(plr)
            end
        end
        notif("spawnkilling everyone else")
    else
        if exec(target) ~= false then
            notif("spawnkilling "..target.DisplayName)
        else
            notif("you are already spawnkilling that dude", true)
        end
    end
end)

cmd("unspawnkill", {"unfloorkill"}, "", 5, {"player"}, function(target: Player | "all")
    local function exec(plrName)
        if Tasks.isRunning(plrName.."spawnkill") then
            Tasks.stop(plrName.."spawnkill")
            return true
        end
    end

    if target == "all" then
        for _, plr in Players:GetPlayers() do
            exec(plr.Name)
        end
        notif("spawnkilling has been stopped for everyone")
    else
        if exec(target.Name) then
            notif("spawnkilling has been stopped for "..target.DisplayName)
        else
            notif("you are not spawnkilling this guy", true)
        end
    end
end)

cmd("lockmusic", "locks the recently playing music", 7, function()
    Toggles.toggle("Lock Music", true)
end)

cmd("unlockmusic", "unlocks the shit", 7, function()
    Toggles.toggle("Lock Music", false)
    broadcast("< KohlsNoob >  music has been unlocked")
    notif("music has been unlocked")
end)

cmd("void", "my Stand, Cream, shall send the target to the emptiness of the dark realm.", 5, {"player"}, function(target: Player)
    if typeof(target) ~= "Instance" then return end

    local root = localchar.HumanoidRootPart
    local oldpos = root.CFrame
    root.CFrame = CFrame.new(0, -200, 0)
    task.wait(.25)
    chat("bring "..target.Name)
    chat("unfly "..target.Name)
    wait()
    root.CFrame = oldpos
    notif(target.DisplayName.." has been sent to the void")
end)

cmd("skytrap", "locks them in the sky", 5, {"player"}, function(target: Player)
    if type(target) ~= "userdata" then return notif("player not found") end

    if Tasks.isRunning("skytrap"..target.Name) then
        return notif(`{target.DisplayName} is already in skytrap`)
    end

    Tasks.start("skytrap"..target.Name, function()
        while task.wait() do
            local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            if root and root.Position.Y < 2000 then
                local n = Util.shortenName(target.Name)
                chat("nograv "..target.Name)
                chat(`skydive {n},{n},{n}{hidder}`)
                chat(`skydive {n},{n},{n}{hidder}`)
                chat("fling "..target.Name)
                task.wait(1)
            end
        end
    end)

    notif(`{target.DisplayName} has been trapped in sky`)
end)

cmd("unskytrap", "", 5, {"player"}, function(target: Player)
    if type(target) ~= "userdata" then return notif("player not found") end

    if Tasks.isRunning("skytrap"..target.Name) then
        Tasks.stop("skytrap"..target.Name)
        notif("freed "..target.DisplayName)
    else
        notif(`{target.DisplayName} is not in skytrap`)
    end
end)

cmd("rocket", "makes a player literally become rocket", 5, {"player"}, function(target: Player | "all")
    local function exec(plrName)
        chat("hat "..plrName.." 000000000000000000000000000131535161669793") 
		chat("unfly "..plrName)
		chat("setgrav "..plrName.." -220") -- 270
		chat("stun "..plrName)
		--chat("glow "..plrName.." 0 0 255")
        chat("spin "..plrName)
        if target ~= "all" then
            chat("fire "..plrName..","..plrName..","..plrName..","..plrName)
        end
    end

    if target == "all" then
        for _, plr in Players:GetPlayers() do
            chat("fire "..plr.Name..","..plr.Name..","..plr.Name..","..plr.Name)
        end
        exec("all")
        notif("everybody has been ascended")
    else
        exec(target.Name)
        notif(target.DisplayName.." has been ascended")
    end
end)

cmd("zawarudo", {"zw"}, "zaaa warudooo!!!!! (stop time)", 6, function()
	notif("doing za warudo")

    chat("speed others 0")
    chat("sfx 1571597070")
    task.wait(2.7)
    chat(`fogcolor {191/255} {7/255} {202/255}`)
    chat("unfly others")
    chat("fogend 10")
    chat("time 12")
    chat("freeze all")
    wait()
    wait()
    chat("fogend 100")
    chat("time 11.25")
    wait()
    wait()
    chat("fogend 200")
    chat("time 10.75")
    wait()
    wait()
    chat("fogend 300")
    chat("time 10")
    wait()
    wait()
    chat("fogend 400")
    chat("time 9.25")
    wait()
    wait()
    chat("fogend 500")
    chat("time 8.75")
    wait()
    wait()
    chat("fogend 600")
    chat("time 7.75")
    wait(.07)
    wait()
    chat("fogend 500")
    chat("time 7")
    wait()
    wait()
    chat("fogend 400")
    chat("time 6.25")
    wait()
    wait()
    chat("fogend 300")
    chat("time 5.75")
    wait()
    wait()
    chat("fogend 200")
    chat("time 4.75")
    wait()
    wait()
    chat("fogend 100")
    chat("time 4")
    wait()
    wait()
    chat("fogend 10")
    chat("time 2")
    wait(.3)
    chat("fogend 9999")
    chat("time 1")
    chat("sfx 8966275754")
    wait(.1)
    chat("time 0")
    wait()
    timestop = true
    wait(5)
    chat("clr")
    chat("sfx 3298763371")
    wait(1.6) -- 1.6
    chat("time 0")
    chat(`fogcolor {191/255} {7/255} {202/255}`)
    chat("fogend 1000")
    wait()
    wait()
    chat("fogend 900")
    chat("time 1")
    wait()
    wait()
    chat("fogend 800")
    chat("time 2")
    wait()
    wait()
    chat("fogend 700")
    chat("time 3")
    wait()
    wait()
    chat("fogend 600")
    chat("time 4")
    wait()
    wait()
    chat("fogend 500")
    chat("time 5")
    wait()
    wait()
    chat("fogend 400")
    chat("time 6")
    wait()
    wait()
    chat("fogend 300")
    chat("time 7")
    wait()
    wait()
    chat("fogend 200")
    chat("time 8")
    wait()
    wait()
    chat("fogend 100")
    chat("time 9")
    wait()
    wait()
    chat("fogend 10")
    chat("time 12")
    wait()
    chat("stopmusic")
    wait()
    chat("fix")
    wait()
    timestop = false
    task.wait(.2)
    chat("thaw all")
end)

cmd("warudoza", {"kc"}, "fixes za warudo's damage", 6, function()
	notif("action running")
	chat("sfx 5779908464")
	task.wait(1.1)
	chat("sfx 3280066384")
	--chat("fix")
	task.wait(.1)
	chat("time 0")
	task.wait(.1)
	chat("time 12")
	task.wait(.1)
	chat("time 0")
	task.wait(.5)
    chat("time 0")
	chat(`fogcolor {255/255} 0 0`)
	chat("fogend 0")
	task.wait(.4)
	chat(`fogcolor {231/255} {84/255} {128/255}`)
	task.wait(.6)
	chat("fogcolor 0 0 0")
	chat("fogend 50")
	task.wait(.1)
    chat("kill all")
	task.wait(1.9)
	chat("sfx 3373991228")
	task.wait(.1)
	task.wait(.7)
	chat("fix")
end)

cmd("dark", "make it dark", 6, function()
    if not isXeno then
        Cmds.execute("paintmap", {0,0,0})
    end
    local bp = Util.fakeBaseplate()

    chat("fogend 0")
    chat("time 0")
    chat("brightness 0")
    chat("fogend 200")
    task.spawn(function() Util.f3x("SyncSurface", {{Part = bp, Surfaces = {Top = Enum.SurfaceType.Smooth}}}) end)
    task.spawn(function() Util.f3x("SyncColor", {{Part = bp, UnionColoring = true, Color = Color3.new(0,0,0)}}) end)
    task.spawn(function() Util.f3x("SyncMaterial", {{Part = bp, UnionColoring = true, Material = Enum.Material.Neon}}) end)
    Cmds.execute("skybox", {"13657754727"})
end)

cmd("discomap", "makes shit", 6, function()
    Cmds.execute("paintablemap", {true})

    for _,v in workspace:GetDescendants() do
        if v:GetAttribute("paintable") or v.Parent == place:FindFirstChild("Build_Stuff") or v.Parent == place.Obby or v.Parent == place["Obby Box"] then
            Util.paint(v, Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
        end
    end
end)

cmd("inverted", "oh noo my eyes!", 6, function()
    local part = Util.skybox()
    task.spawn(function() Util.f3x("CreateDecorations", {{Part = part, DecorationType = "Highlight"}}) end)
    task.spawn(function() Util.f3x("SyncDecorate", {{Part = part, DecorationType = "Highlight", FillColor = Color3.fromRGB(134.615, 125, 125), FillTransparency = -1}}) end)
    task.spawn(function() Util.f3x("SyncMesh", {{Part = part, Scale = Vector3.new(-99999, -99999, -99999)}}) end)
end)

-- cmd("unlockbuilds", "unlocks all parts built by players", 6, function()
--     Util.f3x("SetLocked", Util.getf3xModifiableItems(), false)
--     notif("successfuly unlocked builds")
-- end)

-- cmd("lockbuilds", "locks all parts built by players", 6, function()
--     Util.f3x("SetLocked", Util.getf3xModifiableItems(), true)
--     notif("successfuly locked builds")
-- end)

cmd("clone", "spawns any amount of clone u want that is below 100", 3, {"number"}, function(amount: number)
	if amount > 99 then return notif("you are being rate limited") end

	local a = 0
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == localplr.Name then
			a = a + 1
		end
	end
	notif("spawning "..tostring(amount).." clones...")
    Util.spamtool(72644644, amount)
	repeat wait()
		local b = 0
		for i,v in pairs(workspace:GetChildren()) do
			if v.Name == localchar.Name then
				b = b + 1
			end
		end
	until b == a+amount
	notif("clones has been spawned")
end)

cmd("table", "throw alot of explosive table", 3, {"number"}, function(amount: number)
	notif("throwing tables...")
    Util.spamtool(243788010, amount, 5)
	notif("tables has been thrown")
end)

cmd("bomb", "plant alot of bombs", 3, {"number"}, function(amount: number)
    notif("planting bombs...")
    Util.spamtool(11999247, amount)
    notif("bombs has been planted")
end)

cmd("forcekill", {"fkill"}, "kills a player even when they're untouchable", 5, {"player"}, function(target: Player)
    print(target)
    Util.f3x("SyncMove", {{Part = target.Character["Torso"], CFrame = target.Character["Torso"].CFrame * CFrame.new(0, 1, 0)}})
    notif("killed "..target.DisplayName)
end)

cmd("musicid", "copies the music id that's currently playing", 7, function()
    if workspace:FindFirstChild("Sound") and workspace.Sound.Playing then
        setclipboard(workspace.Sound.SoundId:split("=")[2])
        notif("copied the music's id to your clipboard")
    else
        notif("no music is playing", true)
    end
end)

cmd("antipunish", "prevents you from being punished", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Punish", state)
    notif("anti punish "..(state and "enabled" or "disabled"))
end)

cmd("antitp", "prevents you from being teleported", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Teleport", state)
    notif("anti teleport "..(state and "enabled" or "disabled"))
end)

-- cmd("fixcolors", {"fixpaint"}, "fixes the map's colors", 6, function()
--     local function r(n)
--         local a,b = math.modf(math.abs(n))
--         return a .. math.round(b * 10)
--     end
    
--     for _,v in place:GetDescendants() do
--         if not v:IsA("BasePart") then continue end
--         local color = dictionary.originalMapColors[`{r(v.Position.X)}{r(v.Position.Y)}{r(v.Position.Z)}`]
--         if color then
--             Util.paint(v, Color3.fromHex(color))
--         end
--     end
--     Util.paint(place.Baseplate, Color3.fromRGB(75, 151, 75))
-- end)

cmd("rainbowfloor", {"rfloor"}, "rainbow floor", 6, function()
    if session.rfloor then return end
    session.rfloor = true
    local bp = Util.fakeBaseplate()
    Util.rainbowify({bp})
    task.spawn(function() Util.f3x("Remove", {bp}) end)
    session.rfloor = false
end)

cmd("rainbowpads", {"rpads"}, "rainbow admin pads", 6, function()
    if session.rpads then return end
    session.rpads = true

    local pads = {}
    for _,v in workspace.Terrain._Game.Admin.Pads:GetChildren() do
        table.insert(pads, v.Head)
    end
    Util.rainbowify(pads)

    session.rpads = false
end)

cmd("rainbowobby", {"rbricks"}, "rainbow obby kill parts", 6, function()
    if session.rbricks then return end
    session.rbricks = true
    Util.rainbowify(place.Obby:GetChildren())
    session.rbricks = false
end)

cmd("rainbowobbybox", {"rbox"}, "rainbow obby box", 6, function()
    if session.rbox then return end
    session.rbox = true
    Util.rainbowify(place["Obby Box"]:GetChildren())
    session.rbox = false
end)

cmd("rlight", "rainbow house light", 6, function()
    if session.rlight then return end
    session.rlight = true
    Util.rainbowify({place["House Light"].PointLight}, 60)
    session.rlight = false
end)

cmd("rainbowspeed", {"rspeed"}, "set the rainbow cycle speed", 6, {"number"}, function(speed: number)
    _settings.rainbowSpeed = speed
end)

cmd("permjail", "your enemy can't get out of your jail", 5, {"player"}, function(target: Player)
    if Tasks.isRunning(target.Name.."permjail") then
        return notif(target.DisplayName.." is already in permjail")
    end

    Tasks.start(target.Name.."permjail", function()
        while task.wait() do
            if target.Character:WaitForChild("Humanoid").Health <= 0 then
                if not target.Character:GetAttribute("reloaded") then
                    target.Character:SetAttribute("reloaded", true)
                    chat("reset "..target.Name)
                end
                continue
            end

            if not workspace:FindFirstChild(target.Name.."'s jail") then
                chat("jail "..target.Name)
                workspace:WaitForChild(target.Name.."'s jail", .5)
                if not workspace:FindFirstChild(target.Name.."'s jail") then
                    continue
                end
            end

            if localchar:FindFirstChild("HumanoidRootPart") and (workspace[target.Name.."'s jail"]:GetBoundingBox().p - localchar.HumanoidRootPart.Position).magnitude < 4 then
                --chat("respawn "..target.Name)
            end

            if target.Character:FindFirstChild("HumanoidRootPart") and (workspace[target.Name.."'s jail"]:GetBoundingBox().p - target.Character.HumanoidRootPart.Position).magnitude > 5 then
                chat("jail "..target.Name)
                chat("reset "..target.Name)
                
                local start = tick()
                local done = false

                local conn; conn = workspace.ChildAdded:Connect(function(obj)
                    if obj.Name == target.Name.."'s jail" then
                        conn:Disconnect()
                        done = true
                    end
                end)

                repeat task.wait()
                until done or tick() - start > .5

                conn:Disconnect()
            end 
        end
    end)

    notif("permjailed "..target.DisplayName)
end)

cmd("unpermjail", "frees them from permjail", 5, {"player"}, function(target: Player)
    if not Tasks.isRunning(target.Name.."permjail") then
        return notif(target.DisplayName.." is not in permjail")
    end

    Tasks.stop(target.Name.."permjail")
    chat("unjail "..target.Name)
    notif("freed "..target.DisplayName.." from permjail")
end)

cmd("anticontrol", "stops players from controlling you", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Control", state)
    notif("anti control "..(state and "enabled" or "disabled"))
end)

cmd("antijail", "anti jail", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Jail", state)
    notif("anti jail "..(state and "enabled" or "disabled"))
end)

cmd("setspawnpoint", "sets the game's spawnpoint", 7, function()
    local spawns = {}

    if not workspace["Realistic Bloom"]:FindFirstChild("KNSpawn") then
        local sample = Util.f3x("SyncTransform", {{Part = Util.makeLockedPart(CFrame.new(9e9,9e9,9e9), workspace["Realistic Bloom"]), Type = "Spawn"}})[1]
        local clone = {}
        local material = {}
        local collision = {}

        for i = 1,99 do
            table.insert(clone, sample)
        end
        spawns = Util.f3x("Clone", clone, workspace["Realistic Bloom"])
        table.insert(spawns, sample)
        for _,v in spawns do
            table.insert(material, {Part = v, Transparency = 1})
            table.insert(collision, {Part = v, CanCollide = false})
        end

        task.spawn(function() Util.f3x("SetName", spawns, "KNSpawn") end)
        task.spawn(function() Util.f3x("SyncMaterial", material) end)
        task.spawn(function() Util.f3x("SyncCollision", collision) end)
    else
        for _,v in workspace["Realistic Bloom"]:GetChildren() do
            if v.Name == "KNSpawn" then
                table.insert(spawns, v)
            end
        end
    end

    local payload = {}
    for _,v in spawns do
        table.insert(payload, {Part = v, CFrame = localchar.HumanoidRootPart.CFrame - Vector3.new(0, 3.6)})
    end
    Util.f3x("SyncMove", payload)

    notif("successfuly set the game's spawnpoint to your position")
end)

cmd("unsetspawnpoint", "", 7, function()
    local spawns = {}

    for _,v in workspace["Realistic Bloom"]:GetChildren() do
        if v.Name == "KNSpawn" then
            table.insert(spawns, v)
        end
    end

    Util.f3x("Remove", spawns)
    notif("successfuly removed the spawnpoint")
end)

-- looking for crash command? fuck off nigga

cmd("lag", "lags a player? jokes on you this lags the whole server", 7, function()
    Util.spamtool(253519495, 45)
    notif("done")
end)

cmd("antifling", "prevents you from being flinged", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Fling", state)
    notif("anti fling "..(state and "enabled" or "disabled"))
end)

cmd("blender", "do something funny on the target", 5, {"player"}, function(target: Player)
	if type(target) == "userdata" then
		chat("jail "..target.Name)
		chat("stun "..target.Name)
		chat("spin "..target.Name)
		chat("fire "..target.Name)
		chat("name "..target.Name.." help me")
		notif("success")
	else
		notif("player not found")
	end
end)

cmd("drop", "drops alot of gear", 8, {"gear", "number"}, function(gear: any, amount: number)
	for i = 1,tonumber(amount) do
		chat("gear me "..gear)
		localplr.Backpack.ChildAdded:Wait()
		local gear = localplr.Backpack:FindFirstChildOfClass("Tool")
		localchar.Humanoid:EquipTool(gear)
		if gear.Parent ~= localchar then
			repeat localchar.Humanoid:EquipTool(gear) wait()
			until gear.Parent == localchar
		end
		gear.Parent = workspace
	end	
end)

cmd("bangears2", "ban the target from gears but remake version", 5, {"player"}, function(target: Player)
	if type(target) == "userdata" then
		local OldPos = localchar.HumanoidRootPart.CFrame
        chat("freeze "..target.Name)
		chat("gear me 82357101")
		local tool = localplr.Backpack:WaitForChild("PortableJustice")
		localchar.Humanoid:EquipTool(tool)
		localchar:PivotTo(target.Character:GetPivot())
		repeat tool:WaitForChild("MouseClick"):FireServer(target.Character) wait()
		until target.Character:FindFirstChild("Part")
		chat("reset "..target.Name)
		localchar.HumanoidRootPart.CFrame = OldPos
		localchar.Humanoid.Jump = true
		localchar.Humanoid:UnequipTools(tool)
		tool.Parent = nil
		broadcast("< KohlsNoob >  "..target.DisplayName.." has been banned from using gears in this server")
	else
		notif("player not found")
	end
end)

cmd("antifreeze", "prevents you from being frozen", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Freeze", state)
    notif("anti freeze "..(state and "enabled" or "disabled"))
end)

cmd("invite", "displays discord invite", 1, function()
	say("Invite Code: V MS XK jS 5d u")
	broadcast("< KohlsNoob >  Invite Code: V MS XK jS 5d u")
end)

cmd("glitchbaseplate", {"glitchbp"}, "glitches the baseplate", 7, function()
    if isXeno then return notif("this command does not support Xeno, try using Solara", 7) end
    notif("glitching the baseplate...")

    chat("gear me 19704064")
	chat("gear me 32356064")

    local baseplate = Util.fakeBaseplate()
	local ice = localplr.Backpack:WaitForChild("IceStaff")
	local rocket = localplr.Backpack:WaitForChild("BigRocketLauncher")

    ice:WaitForChild("LocalScript").Enabled = false
	rocket:WaitForChild("Client").Enabled = false

    ice:WaitForChild("ClientControl").OnClientInvoke = function(mode, value)
		if mode == "MousePosition" then
			local pos = localchar.HumanoidRootPart.Position
			return ((mouse and {Position = Vector3.new(pos.X*1.2,baseplate.Position.Y+baseplate.Size.Y/2,pos.Z*1.2), Target = baseplate}) or nil)
		end
	end

    rocket:WaitForChild("MouseLoc").OnClientInvoke = function()
        return workspace:WaitForChild("IceWall"):WaitForChild("IceBlock").Position
    end

    localchar.HumanoidRootPart.CFrame = CFrame.new(-89.960, 3.700, -32.345)
    ice.Parent = localchar
    rocket.Parent = localchar

	repeat 
        if ice.Parent == localchar and rocket.Parent == localchar then
            ice:Activate()
            rocket:Activate()
        end
        wait()
	until baseplate.AssemblyLinearVelocity.magnitude ~= 0

    ice.Parent = nil
    rocket.Parent = nil
    chat("clr")
	chat("fly me")
    broadcast("< KohlsNoob >  baseplate has been glitched LOL")
end)

cmd("fix", "ehh", 1, function()
    local remove = workspace["Realistic Bloom"]:GetChildren()
    local remove2 = {}

    if place.Parent.Parent ~= workspace.Terrain then
        for _,v in place:GetChildren() do
            if v.Name == "Build_Stuff" and v.Name == "Spawn" then continue end
            if v.Name == "Obby" and v.WorldPivot == CFrame.new(-41.0650024, 1.30000007, 6.74300194, 0, 0, -1, 0, 1, 0, 1, 0, 0) then continue end
            if v.Name == "Obby Box" and v.WorldPivot == CFrame.new(-30.0650043, 23.4649982, 35.3430099, 1, 0, 0, 0, 1, 0, 0, 0, 1) then continue end
            if v.Name == "Basic House" or v.Name == "House" then
                table.insert(remove, v)
            else
                table.insert(remove2, v)
            end
        end
    end

    task.spawn(function() Util.f3x("Remove", remove) end)
    task.spawn(function() Util.f3x("Remove2", remove) end)
    chat("fix")
end)

cmd("msg", "you will see", 1, {"message"}, function(...)
    broadcast(table.concat({...}, " "))
end)

cmd("padabuse", "locks all admin pads to yourself >:)", 2, {"on/off"}, function(state: boolean)
    Toggles.toggle("Pad Abuse", state)
    notif("pad abuse "..(state and "enabled" or "disabled"))
end)

cmd("bodyswap", "", 5, {"player"}, function(target: Player)
    if type(target) == "userdata" then
		chat("char me "..tostring(target.UserId))
		chat("char "..target.Name.." "..tostring(localplr.UserId))
		chat("name "..target.Name.." "..localplr.DisplayName)
		chat("name me "..target.DisplayName)
		notif("body swapped")
    else
        notif("player not found")
    end
end)

cmd("cctp", "control click tp", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("CCTP", state)
    notif("control click tp "..(state and "enabled" or "disabled"))
end)

cmd("yeet", "yeet the heck out of them", 5, {"player"}, function(target: Player | "all")
    if type(target) == "userdata" then
        target = target.Name
    end
    chat("stun "..target)
    chat("nograv "..target)
    chat("ff "..target)
    for i = 0,5 do
        chat("explode "..target)
    end
    notif(target.." has been yeeted")
end)

cmd("kit", "oh yeah", 8, {"player", "kit name"}, function(target: Player | "all", kit: string)
    if type(target) == "userdata" then
        target = target.Name
    end

    if not dictionary.kits[kit] then
        return notif("invalid kit name")
    end

    for _,id in dictionary.kits[kit] do
        chat(`gear {target} {string.rep("0", 20)}{id}`)
    end

    notif("gave "..target.." "..kit.." kit")
end)

cmd("kitlist", "list of the kits within the script", 8, function()
	print("------------------------KIT LIST----------------------------")
    local i = 1
	for v in pairs(dictionary.kits) do
		print(i..". "..v)
        i += 1
	end
	print("------------------------------------------------------------")
	notif("press F9 for the list of kits")
end)

cmd("theme", "sets the server theme", 8, {"theme name"}, function(penis: string)
	if penis == "snow" then
		chat("fix")
		wait()
		chat("fogcolor 1 1 1")
		chat("fogend 500")
		chat("time 17.4")
		chat("colorshifttop 255 255 255")
		chat("colorshiftbottom 255 255 255")
		-- chat("gear me 18474459")
		-- local tool = LocalPlayer.Backpack:WaitForChild("PaintBucket")
		-- PlrChar.Humanoid:EquipTool(tool)
		-- for _,I in pairs(workspace.Terrain._Game.Workspace:GetDescendants()) do
		-- 	local IsPart = pcall(function()
		-- 		if I.Color then
		-- 		end
		-- 	end)
		-- 	if IsPart then
		-- 		if I.Color == Color3.fromRGB(196, 40, 28) or I:IsDescendantOf(workspace.Terrain._Game.Workspace.Obby) then
		-- 			spawn(function()
		-- 				PlrChar.PaintBucket:WaitForChild("Remotes"):WaitForChild("ServerControls"):InvokeServer("PaintPart", {Part = I, Color = Color3.fromRGB(255,255,255)})
		-- 			end)
		-- 		end
		-- 	end
		-- end	
		-- wait()
		-- PlrChar.Humanoid:UnequipTools(PlrChar.PaintBucket)
		-- LocalPlayer.Backpack.PaintBucket.Parent = nil
		broadcast("< KohlsNoob >  server theme set to snow :D")
	elseif penis == "sunset" then
		chat("fix")
		wait()
		chat("time 17.4")
		chat("colorshifttop 600 400 0")
		chat("colorshiftbottom 600 400 0")
		broadcast("server theme set to sunset :D")
	elseif penis == "ice" then
		chat("fix")
		wait()
		chat(`fogcolor {-100/255} {-400/255} {-600/255}`)
		chat("fogend 500")
		chat("time 17.4")
		chat("colorshifttop 0 255 255")
		chat("colorshiftbottom 0 255 255")
		broadcast("< KohlsNoob >  server theme set to ice :D")
	elseif penis == "blood" then
		chat("fix")
		wait()
		chat("fogcolor 1 0 0")
		chat("fogend 150")
		chat("ambient 1 0 0")
		chat("colorshifttop 255 0 0")
		chat("colorshiftbottom 255 0 0")
		broadcast("< KohlsNoob >  server theme set to blood :D")
	elseif penis == "aesthetic" then
		chat("fix")
		wait()
		chat("time 15")
		chat("fogend 500")
		chat(`fogcolor {-400/255} {-191/255} {-139/255}`)
		chat("outdoorambient 191, 143, 95")
		chat("colorshifttop 255, 191, 139")
		broadcast("< KohlsNoob >  server theme set to aesthetic :D")
	elseif penis == "heaven" then
		chat("fix")
		wait()
		chat("time 14")
		chat("fogend 200")
		chat("fogcolor -1.17647058824 -1.17647058824 -1.17647058824")
		chat("outdoorambient -400, -400, -400")
		chat("ambient -1.56862745098 -1.56862745098 -1.56862745098")
        broadcast("< KohlsNoob >  server theme set to heaven :D")
	elseif penis == "hell" then
		chat("fix")
		wait()
		chat("time 0")
		chat("outdoorambient -600 0 0")
		chat(`ambient {-600/255} 0 0`)
		chat(`fogcolor {-600/255} 0 0`)
		chat("fogend 500")
		chat("colorshiftbottom -600 0 0")
		chat("colorshifttop -600 0 0")
		chat("brightness 2")
		chat("invis all")
		chat("bonfire all")
		chat("Clone all")
		chat("vis all")
		broadcast("< KohlsNoob >  server theme set to hell >;)")
	elseif penis == "dark" then
		chat("fix")
		wait()
		chat("fogend 70")
		chat("fogcolor 0 0 0")
		chat("brightness 0")
		broadcast("< KohlsNoob >  server theme set to dark >:D")
	-- elseif penis == "halloween" then
	-- 	chat("gear me 18474459")
	-- 	local parts = {"Divider9","Divider6","Divider5","Divider7","Divider3","Back","Divider10","Divider4","Divider2","Divider1","Divider8","Jump0","Jump1","Jump9","Jump2","Jump6","Jump3","Jump4","Jump7","Jump8","Jump5","Left Wall","Ceiling Wall","Back Wall","Right Wall","SmoothBlockModel100","SmoothBlockModel116","SmoothBlockModel82","SmoothBlockModel71","SmoothBlockModel41","SmoothBlockModel15","SmoothBlockModel62","SmoothBlockModel30","SmoothBlockModel14","SmoothBlockModel27","SmoothBlockModel20","SmoothBlockModel13","SmoothBlockModel58","SmoothBlockModel6","SmoothBlockModel51","SmoothBlockModel8","SmoothBlockModel19","SmoothBlockModel18","SmoothBlockModel5","SmoothBlockModel25","SmoothBlockModel9","SmoothBlockModel11","SmoothBlockModel95","SmoothBlockModel33","SmoothBlockModel162","SmoothBlockModel32","SmoothBlockModel29","SmoothBlockModel22","SmoothBlockModel61","SmoothBlockModel63","SmoothBlockModel23","SmoothBlockModel131","SmoothBlockModel24","SmoothBlockModel31","SmoothBlockModel67","SmoothBlockModel178","SmoothBlockModel12","SmoothBlockModel34","SmoothBlockModel4","SmoothBlockModel39","SmoothBlockModel35","SmoothBlockModel40","SmoothBlockModel130","SmoothBlockModel36","SmoothBlockModel48","SmoothBlockModel38","SmoothBlockModel43","SmoothBlockModel44","SmoothBlockModel28","SmoothBlockModel45","SmoothBlockModel47","SmoothBlockModel49","SmoothBlockModel59","SmoothBlockModel60","SmoothBlockModel3","SmoothBlockModel66","SmoothBlockModel70","SmoothBlockModel87","SmoothBlockModel102","SmoothBlockModel74","SmoothBlockModel119","SmoothBlockModel1","SmoothBlockModel77","SmoothBlockModel79","SmoothBlockModel80","SmoothBlockModel76","SmoothBlockModel98","SmoothBlockModel37","SmoothBlockModel83","SmoothBlockModel118","SmoothBlockModel52","SmoothBlockModel10","SmoothBlockModel84","SmoothBlockModel176","SmoothBlockModel64","SmoothBlockModel89","SmoothBlockModel68","SmoothBlockModel86","SmoothBlockModel105","SmoothBlockModel113","SmoothBlockModel42","SmoothBlockModel21","SmoothBlockModel140","SmoothBlockModel143","SmoothBlockModel137","SmoothBlockModel128","SmoothBlockModel120","SmoothBlockModel127","SmoothBlockModel129","SmoothBlockModel75","SmoothBlockModel124","SmoothBlockModel117","SmoothBlockModel115","SmoothBlockModel99","SmoothBlockModel114","SmoothBlockModel110","SmoothBlockModel122","SmoothBlockModel160","SmoothBlockModel2","SmoothBlockModel73","SmoothBlockModel81","SmoothBlockModel7","SmoothBlockModel106","SmoothBlockModel69","SmoothBlockModel50","SmoothBlockModel78","SmoothBlockModel103","SmoothBlockModel108","SmoothBlockModel16","SmoothBlockModel147","SmoothBlockModel165","SmoothBlockModel126","SmoothBlockModel123","SmoothBlockModel26","SmoothBlockModel57","SmoothBlockModel55","SmoothBlockModel17","SmoothBlockModel104","SmoothBlockModel54","SmoothBlockModel65","SmoothBlockModel109","SmoothBlockModel56","SmoothBlockModel46","SmoothBlockModel72","SmoothBlockModel112","SmoothBlockModel53","SmoothBlockModel97","SmoothBlockModel135","SmoothBlockModel111","SmoothBlockModel88","SmoothBlockModel125","SmoothBlockModel107","SmoothBlockModel159","SmoothBlockModel94","SmoothBlockModel121","SmoothBlockModel207","SmoothBlockModel179","SmoothBlockModel85","SmoothBlockModel170","SmoothBlockModel151","SmoothBlockModel92","SmoothBlockModel215","SmoothBlockModel193","SmoothBlockModel93","SmoothBlockModel134","SmoothBlockModel186","SmoothBlockModel139","SmoothBlockModel101","SmoothBlockModel225","SmoothBlockModel189","SmoothBlockModel161","SmoothBlockModel90","SmoothBlockModel222","SmoothBlockModel146","SmoothBlockModel132","SmoothBlockModel150","SmoothBlockModel226","SmoothBlockModel138","SmoothBlockModel141","SmoothBlockModel142","SmoothBlockModel154","SmoothBlockModel201","SmoothBlockModel158","SmoothBlockModel156","SmoothBlockModel164","SmoothBlockModel167","SmoothBlockModel163","SmoothBlockModel173","SmoothBlockModel157","SmoothBlockModel174","SmoothBlockModel175","SmoothBlockModel184","SmoothBlockModel177","SmoothBlockModel188","SmoothBlockModel181","SmoothBlockModel190","SmoothBlockModel205","SmoothBlockModel227","SmoothBlockModel213","SmoothBlockModel204","SmoothBlockModel202","SmoothBlockModel148","SmoothBlockModel216","SmoothBlockModel217","SmoothBlockModel218","SmoothBlockModel197","SmoothBlockModel206","SmoothBlockModel219","SmoothBlockModel183","SmoothBlockModel223","SmoothBlockModel224","SmoothBlockModel228","SmoothBlockModel229","SmoothBlockModel231","SmoothBlockModel203","SmoothBlockModel187","SmoothBlockModel209","SmoothBlockModel155","SmoothBlockModel144","SmoothBlockModel221","SmoothBlockModel214","SmoothBlockModel198","SmoothBlockModel133","SmoothBlockModel230","SmoothBlockModel96","SmoothBlockModel192","SmoothBlockModel172","SmoothBlockModel220","SmoothBlockModel194","SmoothBlockModel185","SmoothBlockModel200","SmoothBlockModel91","SmoothBlockModel166","SmoothBlockModel169","SmoothBlockModel152","SmoothBlockModel149","SmoothBlockModel196","SmoothBlockModel210","SmoothBlockModel195","SmoothBlockModel208","SmoothBlockModel211","SmoothBlockModel136","SmoothBlockModel191","SmoothBlockModel199","SmoothBlockModel153","SmoothBlockModel171","SmoothBlockModel180","SmoothBlockModel212","SmoothBlockModel145","SmoothBlockModel232","SmoothBlockModel168","SmoothBlockModel182","Spawn1","Baseplate","Spawn2","Spawn3","Chimney","Part57","Part56","Part54","Part51","Part49","Part61","Part45","Part41","Part36","Part32","Part27","Part33","Part26","Part25","Part23","Part59","Part20","Part21","Part18","Part17","Part42","Part24","Part16","Part52","Part37","Part14","Part58","Part13","Part19","Part10","Part28","Part39","Part8","Part7","Part40","Part38","Part6","Part15","Part44","Part22","Part4","Part43","Part3","Part2","Part30","Part60","Part34","Part12","Part53","Part35","Part1","Part29","Part46","Part11","Part55","Part48","Part9","Part5"}
	-- 	local colors = {Color3.new(0.811765, 0.458824, 0.00392157 ),Color3.new(0.529412, 0.4, 0 ),Color3.new(0.435294, 0.380392, 0 ),Color3.new(0.623529, 0.419608, 0.00392157 ),Color3.new(0.247059, 0.345098, 0 ),Color3.new(0.529412, 0.4, 0 ),Color3.new(0.905882, 0.47451, 0.00392157 ),Color3.new(0.341176, 0.364706, 0 ),Color3.new(0.152941, 0.32549, 0 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.717647, 0.439216, 0.00392157 ),Color3.new(1, 0, 0 ),Color3.new(0.937255, 0.27451, 0.00784314 ),Color3.new(0.937255, 0, 0.0117647 ),Color3.new(0.937255, 0.0901961, 0.0117647 ),Color3.new(0.937255, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.458824, 0.00392157 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.937255, 0.827451, 0 ),Color3.new(0.937255, 0.364706, 0.00784314 ),Color3.new(0.498039, 0.556863, 0.392157 ),Color3.new(0.498039, 0.556863, 0.392157 ),Color3.new(0.498039, 0.556863, 0.392157 ),Color3.new(0.498039, 0.556863, 0.392157 ),Color3.new(0.937255, 0.027451, 0.0117647 ),Color3.new(0.988235, 0.619608, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.545098, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.458824, 0.00392157 ),Color3.new(0.988235, 0.517647, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.694118, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.611765, 0.00392157 ),Color3.new(0.937255, 0.827451, 0 ),Color3.new(0.988235, 0.419608, 0.00784314 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.611765, 0.00392157 ),Color3.new(0.854902, 0.521569, 0.254902 ),Color3.new(0.988235, 0.694118, 0.00392157 ),Color3.new(0.937255, 0.364706, 0.00784314 ),Color3.new(0.937255, 0.796078, 0 ),Color3.new(0.0431373, 0.188235, 0 ),Color3.new(0.937255, 0.611765, 0.00392157 ),Color3.new(0.988235, 0.596078, 0.00392157 ),Color3.new(0.988235, 0.619608, 0.00392157 ),Color3.new(0.937255, 0.490196, 0.00392157 ),Color3.new(0.937255, 0.458824, 0.00392157 ),Color3.new(0.937255, 0.643137, 0.00392157 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.568627, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0431373, 0.188235, 0 ),Color3.new(0.937255, 0.764706, 0 ),Color3.new(0.937255, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.160784, 0.0431373, 0.443137 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.988235, 0.294118, 0.00784314 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.721569, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.937255, 0.705882, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.764706, 0 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.67451, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.180392, 0.0117647 ),Color3.new(0.937255, 0, 0.0117647 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.937255, 0.396078, 0.00784314 ),Color3.new(0.854902, 0.521569, 0.254902 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.937255, 0.521569, 0.00392157 ),Color3.new(0.937255, 0.827451, 0 ),Color3.new(0.937255, 0.490196, 0.00392157 ),Color3.new(0.988235, 0.443137, 0.00784314 ),Color3.new(0.988235, 0.494118, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.670588, 0.658824, 0.619608 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.490196, 0.00392157 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.341176, 0.00784314 ),Color3.new(0.937255, 0.121569, 0.0117647 ),Color3.new(0.988235, 0.619608, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.580392, 0.00392157 ),Color3.new(0.937255, 0.67451, 0.00392157 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.937255, 0.396078, 0.00784314 ),Color3.new(0.937255, 0.243137, 0.00784314 ),Color3.new(0.937255, 0.27451, 0.00784314 ),Color3.new(0.937255, 0.427451, 0.00784314 ),Color3.new(0.937255, 0.305882, 0.00784314 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.988235, 0.392157, 0.00784314 ),Color3.new(0.937255, 0.427451, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.937255, 0.337255, 0.00784314 ),Color3.new(0.988235, 0.568627, 0.00392157 ),Color3.new(0.0431373, 0.188235, 0 ),Color3.new(0.937255, 0.796078, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.694118, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.596078, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.580392, 0.00392157 ),Color3.new(0.988235, 0.470588, 0.00784314 ),Color3.new(0.988235, 0.596078, 0.00392157 ),Color3.new(0.937255, 0.67451, 0.00392157 ),Color3.new(0.988235, 0.568627, 0.00392157 ),Color3.new(0.0431373, 0.188235, 0 ),Color3.new(0.988235, 0.694118, 0.00392157 ),Color3.new(0.937255, 0.0901961, 0.0117647 ),Color3.new(0.988235, 0.317647, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.796078, 0 ),Color3.new(0.937255, 0.705882, 0 ),Color3.new(0.937255, 0.0588235, 0.0117647 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.396078, 0.00784314 ),Color3.new(0.988235, 0.368627, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.498039, 0.556863, 0.392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.670588, 0.658824, 0.619608 ),Color3.new(0.0588235, 0.305882, 0 ),Color3.new(0.937255, 0.521569, 0.00392157 ),Color3.new(0.937255, 0.152941, 0.0117647 ),Color3.new(0.937255, 0.211765, 0.00784314 ),Color3.new(0.937255, 0.827451, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.427451, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.392157, 0.00784314 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.521569, 0.00392157 ),Color3.new(0.937255, 0.827451, 0 ),Color3.new(0.937255, 0.764706, 0 ),Color3.new(0.937255, 0.67451, 0.00392157 ),Color3.new(0.937255, 0.611765, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.580392, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.937255, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.796078, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.317647, 0.00784314 ),Color3.new(0.937255, 0.796078, 0 ),Color3.new(0.937255, 0.521569, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.619608, 0.00392157 ),Color3.new(0.988235, 0.545098, 0.00392157 ),Color3.new(0.937255, 0.427451, 0.00784314 ),Color3.new(0.937255, 0.490196, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.67451, 0.00392157 ),Color3.new(0.937255, 0.705882, 0 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.796078, 0 ),Color3.new(0.937255, 0.490196, 0.00392157 ),Color3.new(0.937255, 0.396078, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.294118, 0.00784314 ),Color3.new(0.988235, 0.596078, 0.00392157 ),Color3.new(0.937255, 0.611765, 0.00392157 ),Color3.new(0.988235, 0.341176, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.427451, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.517647, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.827451, 0 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.764706, 0 ),Color3.new(0.937255, 0.611765, 0.00392157 ),Color3.new(0.988235, 0.494118, 0.00392157 ),Color3.new(0.937255, 0.458824, 0.00392157 ),Color3.new(0.988235, 0.470588, 0.00784314 ),Color3.new(0.988235, 0.694118, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.521569, 0.00392157 ),Color3.new(0.937255, 0.490196, 0.00392157 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.67451, 0.00392157 ),Color3.new(0.937255, 0.705882, 0 ),Color3.new(0.937255, 0.458824, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.580392, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.937255, 0.705882, 0 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.937255, 0.764706, 0 ),Color3.new(0.937255, 0.580392, 0.00392157 ),Color3.new(0.937255, 0.396078, 0.00784314 ),Color3.new(0.988235, 0.643137, 0.00392157 ),Color3.new(0.988235, 0.419608, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.988235, 0.443137, 0.00784314 ),Color3.new(0.988235, 0.368627, 0.00784314 ),Color3.new(0.937255, 0.733333, 0 ),Color3.new(0.988235, 0.568627, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.396078, 0.00784314 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.937255, 0.458824, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.94902, 0.952941, 0.952941 ),Color3.new(0.937255, 0.54902, 0.00392157 ),Color3.new(0.0666667, 0.0666667, 0.0666667 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.666667, 0.333333, 0 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.239216, 0.0823529, 0.521569 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.505882, 0.137255, 0.00392157 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.384314, 0.145098, 0.819608 ),Color3.new(0.305882, 0.113725, 0.654902 ),Color3.new(0.384314, 0.145098, 0.819608 ),Color3.new(0.156863, 0.0588235, 0.333333 ),Color3.new(0.631373, 0.168627, 0.00392157 ),Color3.new(0.258824, 0.0666667, 0 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.505882, 0.137255, 0.00392157 ),Color3.new(0.258824, 0.0666667, 0 ),Color3.new(0.631373, 0.168627, 0.00392157 ),Color3.new(0.403922, 0.109804, 0.00392157 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.321569, 0.0862745, 0 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.792157, 0.211765, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.258824, 0.0666667, 0 ),Color3.new(0.792157, 0.211765, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.505882, 0.137255, 0.00392157 ),Color3.new(0.384314, 0.145098, 0.819608 ),Color3.new(0.505882, 0.137255, 0.00392157 ),Color3.new(0.0980392, 0.0352941, 0.211765 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.403922, 0.109804, 0.00392157 ),Color3.new(0.321569, 0.0862745, 0 ),Color3.new(0.321569, 0.0862745, 0 ),Color3.new(0.321569, 0.0862745, 0 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.505882, 0.137255, 0.00392157 ),Color3.new(0.631373, 0.168627, 0.00392157 ),Color3.new(0.631373, 0.168627, 0.00392157 ),Color3.new(0.792157, 0.211765, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.321569, 0.0862745, 0 ),Color3.new(0.639216, 0.635294, 0.647059 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.384314, 0.145098, 0.819608 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.631373, 0.168627, 0.00392157 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.988235, 0.266667, 0.00784314 ),Color3.new(0.403922, 0.109804, 0.00392157 ),Color3.new(0.403922, 0.109804, 0.00392157 )}
	-- 	PlrChar.Humanoid:EquipTool(LocalPlayer.Backpack:WaitForChild("PaintBucket"))
	-- 	for _,v in pairs(workspace.Terrain._Game.Workspace:GetDescendants()) do
	-- 		for i,v2 in pairs(parts) do
	-- 			if v.Name == v2 then
	-- 				spawn(function()
	-- 					PlrChar.PaintBucket:WaitForChild("Remotes"):WaitForChild("ServerControls"):InvokeServer("PaintPart", {Part = v, Color = colors[i]})
	-- 				end)
	-- 			end
	-- 		end
	-- 	end
	-- 	wait()
	-- 	PlrChar.Humanoid:UnequipTools(PlrChar.PaintBucket)
	-- 	LocalPlayer.Backpack.PaintBucket.Parent = nil
	-- 	say("server theme set to halloween :D")
	end
end)

cmd("themelist", "list of the current themes within the script", 8, function()
	print("---------------------THEME LIST--------------------------")
	print("1. snow")
	print("2. sunset")
	print("3. ice")
	print("4. blood")
	print("5. aesthetic")
	print("6. heaven")
	print("7. hell")
	print("8. dark")
	print("------------------------------------------------------------")
	notif("press F9 for the list of the themes")
end)

cmd("creeper", "turns the target into creeper then explode them", 5, {"player"}, function(target: Player | "all")
    if target ~= "all" then
        target = target.Name
    end

    notif(target.." has been turned into a creeper")
    chat("char "..target.." 9e9")
    chat("unff "..target)
    chat("creeper "..target)
    local col = "red"
    wait(1)
    local e
    for i = 1,20 do
        chat("paint "..target.." "..col)
        if col == "red" then 
            col = "green"
        else
            col = "red"
        end
        if i < 11 then
            task.wait(((10-i)*.06)+(i*.007))
            if i == 10 then
                e = ((10-i)*.06)+(i*.007)
            end
        else
            task.wait(e)
        end
    end
    wait()
    chat("explode "..target)
end)

cmd("equip", "equips multiple gear", 8, {"gear", "number"}, function(gearId: any, amount: number)
	if gearId == "all" then
		for i,v in pairs(localplr.Backpack:GetChildren()) do
			v.Parent = localchar
			if v.Parent ~= localchar then
				spawn(function()
					repeat v.Parent = localchar wait()
					until v.Parent == localchar
				end)
			end
		end
		return
	end
	for i = 1,tonumber(amount) do
		chat("gear me "..gearId)
		localplr.Backpack.ChildAdded:Wait()
		local gear = localplr.Backpack:FindFirstChildOfClass("Tool")
		gear.Parent = localchar
		if gear.Parent ~= localchar then
			spawn(function()
				repeat gear.Parent = localchar wait()
				until gear.Parent == localchar
			end)
		end
	end
end)

cmd("sunset", "sun/moon sunset animation", 6, function()
	notif("doing sunset...")
	for i = 0, 300, 004 do
        task.wait(1/10)
        if session.spamSuspended then
            repeat task.wait()
            until not session.spamSuspended
        end
		chat("time 14."..tostring(i))
	end
end)

cmd("sunrise", "sun/moon sunrise animation", 6, function()
	notif("doing sunrise...")
	for i = 300, 0, -004 do
        task.wait(1/10)
        if session.spamSuspended then
            repeat task.wait()
            until not session.spamSuspended
        end
		chat("time 14."..tostring(i))
	end
end)

cmd("fuck", "shut the fuck up bitch", 5, {"player"}, function(target: Player)
    if Tasks.isRunning("spam") then
        return notif("cannot use this command while spamming", true)
    end

    if type(target) == "userdata" then
        if target == localplr then
            return notif("you can't fuck yourself")
        end

        Util.getf3x()
		chat("reset "..target.Name)
        target.CharacterAdded:wait()
		chat("jail "..target.Name)
		chat("punish "..target.Name)
        local conn; conn = workspace.ChildAdded:Connect(function(obj)
            print(obj)
            if obj.Name == target.Name.."'s jail" then
                conn:Disconnect()
                RunService.Heartbeat:Wait()
                local parts = {}
                for _,v in obj:GetChildren() do
                    if v.Name == "Part" then
                        table.insert(parts, {Part = v, Transparency = 0.2})
                    end
                end
                Util.f3x("SyncMaterial", parts)
            end
        end)
        game.Lighting:WaitForChild(target.Name)
        Cmds.execute("spam", {"explode", string.rep(Util.shortenName(target.Name)..",",3)})
		notif("fucking "..target.DisplayName)
    else
        notif("player not found")
    end
end)

cmd("bsod", "black screen of death but its not real", 7, function()
	local msg = [[
:(           ⸻      ⸻      ⸻      ⸻

The server ran into a problem and needs reboot. We're
just collecting some error info, and we'll reboot for
you.]]

--[[
20% complete                                                             


...............  for more information, join KohlsNoob           
...............  Invite Code: V MS XK jS 5d u                     
...............                                                                   
...............  stop code: SERVER_CRASHED       
]]--

    chat("clr")
    chat("respawn all")
    wait()
    chat("punish all")
    chat("time 0")
    chat("fogend 0")
    chat("fogcolor 0 0 0")
    chat("name all    ")
	chat("setmessage "..string.rep("\n",30)..msg)
    wait()
    Util.regen()
end)

cmd("floatspin", {"fspin"}, "float spin", 5, {"player"}, function(target: Player)
    if target ~= "all" then
        target = target.Name
    end
    chat("unfly "..target)
    chat("nograv "..target)
    chat("stun "..target)
    chat("spin "..target)
    notif("float spinned "..target)
end)

cmd("fakebp", "create fake baseplate that you can color and do shit", 6, function()
    if localplr.Name ~= "HaroldNyx" and localplr.Name ~= "haroldjd2017ipad" then return notif("you don't have permission to use this command") end
    Util.fakeBaseplate()
end)

cmd("delete", "lol", 5, {"player"}, function(target: Player)
    if target ~= "all" then
        target = target.Name
    end
    chat("skydive "..string.rep(Util.shortenName(target)..",", 8)..hidder)
    wait()
    chat("speed "..target.." inf")
end)

cmd("taxi", "", 5, {"player"}, function(target: Player)
    if type(target) ~= "userdata" then
        return notif("player not found")
    end
    chat("char "..target.Name.." 9e9")
    wait()
    chat("dog "..target.Name)
    chat("speed "..target.Name.." 100")
    chat("trail "..target.Name.." gold")
    chat("god "..target.Name)
    chat("name "..target.Name.." TAXI")
    chat("paint "..target.Name.." hi")
    task.spawn(function()
        local p = localchar:WaitForChild("PaintBucket")
        task.wait(.1)
        p.Parent = localplr.Backpack
    end)
    task.wait(.5)
    for _,v in target.Character:GetChildren() do
        if v:IsA("BasePart") then
            Util.paint(v, Color3.fromRGB(255, 215, 0))
        end
    end
end)

cmd("antiseizure", "", 4, {"on/off"}, function(state: boolean)
    Toggles.toggle("Anti Seizure", state)
    notif("anti seizure "..(state and "enabled" or "disabled"))
end)

cmd("allanti", "get everything all in one", 4, {"on/off"}, function(state: boolean)
    for _,v in {"Anti Kill", "Anti Blind", "Anti Punish", "Anti Control", "Anti Jail", "Anti Fling", "Anti Freeze", "Anti Seizure"} do
        Toggles.toggle(v, state)
    end
    notif((state and "enabled" or "disabled").." all anti's")
end)

cmd("play", "searches the music on roblox and tries to play it ingame", 8, {"music name"}, function(...)
    local args = {...}
    local index = 1

    if #args == 0 then
        return notif("please enter a music name")
    end

    if tonumber(args[1]) then
        index = math.max(0, tonumber(table.remove(args, 1)))
    end

    if tick() - session.lastcsrfrequest > 60 then
        session.lastcsrfrequest = tick()
        repeat
            pcall(function()
                session["toolboxService_x-csrf-token"] = request({
                    Url = "https://apis.roblox.com/toolbox-service/v2/assets:search",
                    Method = "POST"
                }).Headers["x-csrf-token"]
            end)
        until session["toolboxService_x-csrf-token"]
    end

    local res = request({
        Url = "https://apis.roblox.com/toolbox-service/v2/assets:search",
        Method = "POST",
        Body = HttpService:JSONEncode({
            searchCategoryType = "Audio",
            query = table.concat(args, " "),
            maxPageSize = index,
            searchView = "Core"
        }),
        Headers = {
            ["x-csrf-token"] = session["toolboxService_x-csrf-token"],
            ["content-type"] = "application/json; charset=utf-8"
        }
    })

    local result = HttpService:JSONDecode(res.Body)
    local item = result.creatorStoreAssets[index].asset

    notif("playing "..item.name)
    broadcast("< KohlsNoob >  Now playing: "..item.name)
    chat("music "..item.id)
end)

cmd("lockpads", "locks the admin pads", 2, function()
    Toggles.toggle("Lock Pads", true)
    notif("successfuly locked the pads")
end)

cmd("unlockpads", "unlocks the admin pads", 2, function()
    Toggles.toggle("Lock Pads", false)
    if workspace["Realistic Bloom"]:FindFirstChild("KNlock") then
        Util.f3x("Remove", {workspace["Realistic Bloom"]:FindFirstChild("KNlock")})
    end
    notif("successfuly unlocked the pads")
end)

cmd("exec", "", 8, {"code"}, function(...)
    local f = loadstring(table.concat({...}, " "))
    setfenv(f, getfenv())
    f()
end)

cmd("trollscreen", "blocks their view with trollface, it locks it into their camera", 5, {"player"}, function(target: Player)
    if type(target) == "userdata" then
        target = target.Name
    else
        return notif("player not found")
    end

    local localroot = localplr.Character.HumanoidRootPart

    localplr.Character.Humanoid.PlatformStand = true
    chat("gear me 101106419")
    chat("name me  ")
    Util.getf3x()

    task.spawn(function()
        repeat task.wait()
        until localplr.Character:FindFirstChildOfClass("Model") and localplr.Character:FindFirstChildOfClass("Model"):WaitForChild("Head")
        local transparencyPayload = {}
        for _,v in localplr.Character:GetDescendants() do
            if v:IsA("BasePart") then
                table.insert(transparencyPayload, {Part = v, Transparency = 1})
            end
        end
        Util.f3x("SyncMaterial", transparencyPayload)
    end)

    local tool = localplr.Backpack:WaitForChild("Pitchfork")
    RunService.Heartbeat:Wait()
    tool.Parent = localchar
    local scripts = {tool:WaitForChild("TransmitCameraCFrame"), tool:WaitForChild("CameraTransmitterReceiver"), tool:WaitForChild("CameraTransmitter")}
    Util.f3x("Ungroup", {tool})

    local cf = localroot.CFrame * CFrame.new(0, 0, 2)
    local part = Util.makeLockedPart(cf, localchar)
    task.spawn(function() Util.f3x("SetName", {part}, "") end)
    task.spawn(function() Util.f3x("SyncResize", {{Part = part, CFrame = cf, Size = Vector3.new(15, 10, .1)}}) end)
    task.spawn(function() Util.f3x("CreateConstraints", {part, localroot}, {}, part, "Weld") end)
    task.spawn(function() Util.f3x("SyncCollision", {{Part = part, CanCollide = false}}) end)
    task.spawn(function() Util.f3x("SyncColor", {{Part = part, Color = Color3.new()}}) end)
    task.spawn(function() Util.f3x("CreateTextures", {{Part = part, Face = Enum.NormalId.Back, TextureType = "Decal"}}) end)
    task.spawn(function() Util.f3x("SyncTexture", {{Part = part, Face = Enum.NormalId.Back, TextureType = "Decal", Texture = "rbxassetid://6180287256"}}) end)
    task.spawn(function() Util.f3x("SyncMaterial", {{Part = part, Material = Enum.Material.Neon, CastShadow = false, Transparency = 0}}) end)
    task.spawn(function() Util.f3x("SyncAnchor", {{Part = part, Anchored = false}}) end)

    local bv = Instance.new("BodyVelocity", localroot)
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Velocity = Vector3.new(0, 0, 0)

    chat("noclip me")

    local value = (workspace[target].Humanoid:FindFirstChild("CameraTransmitterReceiver") or Util.f3x("Clone", scripts, workspace[target].Humanoid)[2]).CameraCFrame
    
    local conn2 = Players[target].CharacterAdded:Connect(function(char)
        value = Util.f3x("Clone", scripts, char:WaitForChild("Humanoid"))[2].CameraCFrame
    end)

    local conn; conn = game:GetService("RunService").RenderStepped:Connect(function()
        if not part.Parent or not part.Parent.Parent then
            conn:Disconnect()
            conn2:Disconnect()
        end
        if not workspace:FindFirstChild(target) or not workspace[target]:FindFirstChild("HumanoidRootPart") then return end
        local add = workspace[target].HumanoidRootPart.Velocity * Vector3.new(1,0,1) * (DataPing:GetValue() / 1000 + .5)
        localroot.Velocity = Vector3.zero
        localroot.AssemblyLinearVelocity = Vector3.zero
        localroot.AssemblyAngularVelocity = Vector3.zero
        localroot.CFrame = value.Value * CFrame.new(0, 0, -7) + add
    end)

    notif("now blocking "..target.."'s screen 😜", 8)
end)

cmd("trollify", "turns you into troll", 5, {"player"}, function(target: Player | "all")
    local properties = {
        Texture = "rbxassetid://83555878753000",
        Size = "3",
        Rate = "2000",
        Lifetime = "0.07",
        Drag = "300",
        EmissionDirection = Enum.NormalId.Back,
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular
    }

    Util.f3x("CreateDecorations", {{Part = localchar, DecorationType = "ParticleEmitter"}})
    task.spawn(function() properties.Part = localchar; properties.DecorationType = "ParticleEmitter" Util.f3x("SyncDecorate", {properties}) end)
    local particle = localchar:WaitForChild("ParticleEmitter")

    local function trollify(char)
        local parts = {}
        for _,v in char:GetDescendants() do
            if v:IsA("BasePart") then
                table.insert(parts, {Part = v, Transparency = v.Name ~= "Head" and 1 or .99})
            end
        end
        task.spawn(function() Util.f3x("Clone", {particle}, char.HumanoidRootPart) end)
        task.spawn(function() Util.f3x("SyncMaterial", parts) end)
    end

    if type(target) == "userdata" then
        trollify(target.Character)
    else
        for _,plr in Players:GetPlayers() do
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                trollify(plr.Character)
            end
        end
    end
end)

cmd("trail", "its a trail but its made out of images!1!1!!!", 5, {"player", "image ID"}, function(target: Player, id: number)
    local properties = {
        Texture = "rbxthumb://type=Asset&id=" .. id .. "&w=420&h=420",
        Size = "2",
        Rate = "2000",
        Lifetime = "2",
        Speed = ".1",
        EmissionDirection = Enum.NormalId.Back,
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
    }

    task.spawn(function() Util.f3x("CreateDecorations", {{Part = localchar, DecorationType = "ParticleEmitter"}}) end)
    task.spawn(function() properties.Part = localchar; properties.DecorationType = "ParticleEmitter" Util.f3x("SyncDecorate", {properties}) end)
    local particle = localchar:WaitForChild("ParticleEmitter")

    if type(target) == "userdata" then
        Util.f3x("Clone", {particle}, target.Character.HumanoidRootPart)
    else
        for _,plr in Players:GetPlayers() do
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                task.spawn(function() Util.f3x("Clone", {particle}, plr.Character.HumanoidRootPart) end)
            end
        end
    end
end)

cmd("dex", "dex explorer", 8, function()
    notif("loading dex explorer...")
    loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
end)

cmd("paintablemap", "makes the house and baseplate paintable", 6, function(nopaint: boolean?)
    if isXeno then notif("this command does not support Xeno, try using Solara", 7) error("command not supported") end

    task.spawn(Util.fakeBaseplate, nopaint)

    if not isfile("KohlsNoob/house") then
        writefile("KohlsNoob/house", game:HttpGet("https://raw.githubusercontent.com/HaroldNyx/KohlsNoob/refs/heads/main/assets/house_"))
    end

    if not session.house then
        session.house = loadfile("KohlsNoob/house")()
    end

    if workspace["Realistic Bloom"]:FindFirstChild("Smooth Block Model ") then return end

    if not localplr.Backpack:FindFirstChild("PaintBucket") and not localchar:FindFirstChild("PaintBucket") then
        chat("gear me 18474459")
    end

    local houseData = HttpService:JSONDecode(buffer.tostring(EncodingService:Base64Decode(buffer.fromstring(session.house))))
    local originalParts = house:GetChildren()

    local parts = Util.makeLockedPart(CFrame.new(9e9,9e9,9e9), workspace, 231)
    Util.f3x("SetParent", parts, localchar)

    local resizes = {}
    local colors = {}
    local materials = {}

    for i,v in houseData do
        local cf = CFrame.new(table.unpack(v[1]:split(",")))
        local size = Vector3.new(table.unpack(v[2]:split(",")))
        local color = Color3.new(table.unpack(v[3]:split(",")))
        local material = v[4]
        table.insert(resizes, {Part = parts[i], CFrame = cf, Size = size + Vector3.new(.016, .016, .016)})
        table.insert(colors, {Part = parts[i], Color = color, UnionColoring = true})
        table.insert(materials, {Part = parts[i], Material = material})
        parts[i]:SetAttribute("paintable", true)
    end

    if not nopaint then task.spawn(function() Util.f3x("SyncColor", colors) end) end
    task.spawn(function() Util.f3x("SyncResize", resizes) end)
    task.spawn(function() Util.f3x("SyncMaterial", materials) end)
    task.spawn(function() Util.f3x("SetParent", parts, workspace["Realistic Bloom"]) end)
    task.spawn(function() Util.f3x("SetName", parts, "Smooth Block Model ") end)

    -- task.spawn(function()
    --     local items = {}
    --     for _,v in originalParts do
    --         table.insert(items, {Part = v})
    --     end
    --     Util.f3x("CreateMeshes", items)

    --     local items = {}
    --     for _,v in originalParts do
    --         table.insert(items, {Part = v, Scale = Vector3.new(0,0,0)})
    --     end
    --     Util.f3x("SyncMesh", items)

    --     for _,v in originalParts do
    --         v:Destroy()
    --     end

    --     for _,v in parts do
    --         v.CanCollide = true
    --     end
    -- end)

    if session.makingFakeBp then
        repeat task.wait()
        until session.fakebp
    end
end)

cmd("load", "", 6, {"name"}, function(name: string)
    local data = HttpService:JSONDecode(buffer.tostring(EncodingService:Base64Decode(buffer.fromstring(readfile(name)))))

    local created = 0
    local resize = {}
    local colors = {}
    local materials = {}
    local mesh = {}

    for _,v in table.clone(data) do
        local classname = v[1] ~= "Part" and v[1] or "Normal"
        local cf = CFrame.new(table.unpack(v[2]:split(",")))
        local size = Vector3.new(table.unpack(v[3]:split(",")))
        local color = Color3.new(table.unpack(v[4]:split(",")))
        local material = v[5]
        local meshId = v[6] and "rbxassetid://"..v[6]

        task.spawn(function()
            local part = Util.f3x(
                "CreatePart",
                classname,
                cf,
                workspace
            )

            table.insert(resize, {Part = part, CFrame = cf, Size = size})
            table.insert(colors, {Part = part, Color = color, UnionColoring = true})
            table.insert(materials, {Part = part, Material = material})
            
            if meshId then
                table.insert(mesh, {Part = part, MeshId = meshId})
            end

            created += 1
        end)
    end

    repeat task.wait()
    until created == #data

    Util.f3x("SyncResize", resize)
    Util.f3x("SyncColor", colors)
    Util.f3x("SyncMaterial", materials)
    Util.f3x("SyncMesh", mesh)
end)

cmd("customcmds", "make your own command combinations", 9, function()
    notif("custom commands is coming soon...", 7)
end)

cmd("keybinds", "make your own command combinations", 9, function()
    notif("keybinds is coming soon...", 7)
end)

cmd("startupcmds", "make your own command combinations", 9, function()
    notif("startup commands is coming soon...", 7)
end)

cmd("clickcmds", "make your own command combinations", 9, function()
    notif("click commands is coming soon...", 7)
end)

cmd("poop", "turn them into shit", 5, {"player"}, function(target: Player | "all")
    local payload1 = {}
    local payload2 = {}
    local transparency = {}

    local function add(plr)
        if not plr.Character or not plr.Character:FindFirstChild("Head") then return end
        table.insert(payload1, {Part = plr.Character.Head, MeshId = "rbxassetid://14368414181", TextureId = "0", VertexColor = Vector3.new(122/255, 89/255, 1/255), Offset = Vector3.new(0, -2.5, 0)})
        table.insert(payload2, {Part = plr.Character.Head, Scale = Vector3.new(.125, .125, .125)})
        for _,v in plr.Character:GetDescendants() do
            if v:IsA("BasePart") and v.Name ~= "Head" then
                table.insert(transparency, {Part = v, Transparency = 1})
            end
        end
    end

    if type(target) == "userdata" then
        add(target)
    elseif target == "all" then
        for _,plr in Players:GetPlayers() do
            add(plr)
        end
    end

    task.spawn(function() Util.f3x("SyncMesh", payload1) end)
    task.spawn(function() Util.f3x("SyncMesh", payload2) end)
    task.spawn(function() Util.f3x("SyncMaterial", transparency) end)
end)

cmd("rspy", "remote spy", 8, function()
    notif("loading remote spy...")
    loadstring(game:HttpGet("https://gitlab.com/upio/cobalt/-/releases/permalink/latest/downloads/Cobalt.luau"))()
end)

cmd("leash", "make them your pet", 5, {"player"}, function(target: Player)
    local targets = {}

    if type(target) == "userdata" then
        if target == localplr then return notif("you cant leash yourself") end
        table.insert(targets, target.Character.Head)
        chat("stun "..target.Name)
    elseif target == "all" then
        for _,v in Players:GetPlayers() do
            if v ~= localplr and v.Character and v.Character:FindFirstChild("Head") then
                table.insert(targets, v.Character.Head)
            end
        end
        chat("stun others")
    end
    
    Util.f3x("CreateConstraints", targets, {}, localchar["Right Arm"], "RopeConstraint")
end)

cmd("lockbuilds", {"lockparts"}, "yeah bro you know it", 6, function()
    local sampleLocked = Util.makeLockedPart(CFrame.new(9e9,9e9,9e9), localchar)
    local partsToLock = {}
    local lockedParts = {}

    local resize = {}
    local material = {}
    local collision = {}
    local color = {}
    local anchor = {}
    local surface = {}

    for _,v in pairs(workspace:GetChildren()) do
        if v:IsA("BasePart") and v ~= workspace.Terrain then
            table.insert(partsToLock, v)
        end
    end

    local payload = {}
    for i = 1, #partsToLock - 1 do
        table.insert(payload, sampleLocked)
    end
    lockedParts = Util.f3x("Clone", payload, localchar)
    table.insert(lockedParts, sampleLocked)

    for i,v in partsToLock do
        table.insert(resize, {Part = lockedParts[i], Size = v.Size, CFrame = v.CFrame})
        table.insert(material, {Part = lockedParts[i], Material = v.Material, Transparency = v.Transparency, Reflectance = v.Reflectance, Massless = v.Massless, CastShadow = v.CastShadow, CustomPhysicalProperties = v.CustomPhysicalProperties})
        table.insert(collision, {Part = lockedParts[i], CanCollide = v.CanCollide})
        table.insert(color, {Part = lockedParts[i], Color = v.Color, UnionColoring = true})
        table.insert(anchor, {Part = lockedParts[i], Anchored = v.Anchored})
        table.insert(surface, {Part = lockedParts[i], Surfaces = {Back = v.BackSurface, Bottom = v.BottomSurface, Front = v.FrontSurface, Left = v.LeftSurface, Right = v.RightSurface, Top = v.TopSurface}})
    end

    task.spawn(function() Util.f3x("SyncResize", resize) end)
    task.spawn(function() Util.f3x("SyncMaterial", material) end)
    task.spawn(function() Util.f3x("SyncCollision", collision) end)
    task.spawn(function() Util.f3x("SyncColor", color) end)
    task.spawn(function() Util.f3x("SyncAnchor", anchor) end)
    task.spawn(function() Util.f3x("SyncSurface", surface) end)
    task.spawn(function() Util.f3x("Remove", partsToLock) end)
    task.spawn(function() Util.f3x("SetParent", lockedParts, workspace["Realistic Bloom"]) end)
    task.spawn(function() Util.f3x("SetName", lockedParts, "Part") end)
end)

main()

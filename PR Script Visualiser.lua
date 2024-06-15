addCommand("partvisualizer",{"amount","circlesize","power","w","h","t","angleamount","colordistort","colorupdatetime","turnspeed","custommode"},function(args)
if PersonsAdmin then
for i,v in pairs(args) do args[i] = tonumber(v) end
local Amnt = args[1]
local Size = args[2]
local Power = 50-args[3]
local TurnAmount = args[7]
local ColorDistortion = args[8]
local UpdTime = args[9]
local TurnSpeed = args[10]
local CustomMode = args[11]

local PartSize = Vector3.new(args[4],args[5],args[6])
local Parts = {}

local isLoadingParts = false
local function LoadParts()
	if not isLoadingParts then
		isLoadingParts = true
		Size = 0
		spawn(function()
			wait(1)
			isLoadingParts = false
			Size = args[2]
		end)
		for i=1,Amnt-#Parts do
			game.Players:Chat("part/"..tostring(PartSize.X).."/"..tostring(PartSize.Y).."/"..tostring(PartSize.Z))
		end
	end
end
local function NormalizedColor(R,G,B)
	if R>255 then R=255 end
	if R<0 then R=0 end
	if G>255 then G=255 end
	if G<0 then G=0 end
	if B>255 then B=255 end
	if B<0 then B=0 end
	return Color3.new(R/255,G/255,B/255)
end

local function GetVolume()
	if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
		if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").IsPlaying then
			return workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").PlaybackLoudness/Power
		else
			return 0
		end
	else
		return 0
	end
end

local function GetRawVolume()
	local Vol = 0
	
	if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound") then
		if workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").IsPlaying then
			Vol = workspace.Terrain["_Game"].Folder:FindFirstChild("Sound").PlaybackLoudness/ColorDistortion
		else
			Vol = 0
		end
	else
		Vol = 0
	end
	if Vol>255 then Vol=255 end
	return Vol
end

Connections.partvisualizera = workspace.Terrain["_Game"].Folder.ChildAdded:Connect(function(v)
	if not (#Parts > Amnt or #Parts == Amnt) then
		if v.Size == PartSize then
			table.insert(Parts,v)
		end
	end
end)

local Offset = 0
Connections.partvisualizerb = game:GetService("RunService").RenderStepped:Connect(function()
	local Volume = GetVolume()*1
	
	if #Parts == 0 then
		LoadParts()
	end

	for i,v in pairs(Parts) do
		if v.Parent ~= nil then
			local For = math.rad(i*(360/#Parts))+Offset
	    	v.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(0,For,0) * CFrame.new(0,0,Size+Volume) * CFrame.Angles(math.rad(Volume*TurnAmount),0,0)
			v.Velocity = Vector3.new(-30,0.5,0.5)
			v.CanCollide = false
		else
			table.remove(Parts,i)
			spawn(function()
			wait(0.1)
			LoadParts()
			end)
		end
	end
	Offset = Offset + TurnSpeed
	
	if #Parts < Amnt then
		LoadParts()
	end
end)

local RainbowValue = 0
Loops.partvisualizer = true
repeat
pcall(function()
local Paint
pcall(function()
Paint = GetPaint()
end)
Paint.LocalScript.Disabled = true
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PaletteGui") then
game.Players.LocalPlayer.PlayerGui.PaletteGui:Destroy()
end
local ColorXD
RainbowValue = RainbowValue + 0.05
if RainbowValue >= 1 then
	RainbowValue = 0
end
if CustomMode==2 then
ColorXD = NormalizedColor(Color3.fromHSV(RainbowValue,1,1).R*255 + GetRawVolume(),Color3.fromHSV(RainbowValue,1,1).G*255 + GetRawVolume(),Color3.fromHSV(RainbowValue,1,1).B*255 + GetRawVolume())
elseif CustomMode==3 then
local numbert = math.ceil((os.clock()*4)%4)
local dacolorineed
if numbert == 0 or numbert == 1 then
dacolorineed = Color3.new(1,0,0)
end
if numbert == 2 then
dacolorineed = Color3.new(1,1,0)
end
if numbert == 3 then
dacolorineed = Color3.new(0,1,0)
end
if numbert == 4 then
dacolorineed = Color3.new(0,0,1)
end
ColorXD = NormalizedColor(dacolorineed.R*255 + GetRawVolume(),dacolorineed.G*255 + GetRawVolume(),dacolorineed.B*255 + GetRawVolume())
elseif CustomMode==4 then
ColorXD = NormalizedColor(args[12] + GetRawVolume(),args[13] + GetRawVolume(),args[14] + GetRawVolume())
else
if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and CustomColor then
ColorXD = NormalizedColor(game.Players.LocalPlayer.Character.Torso.Color.R*255 + GetRawVolume(),game.Players.LocalPlayer.Character.Torso.Color.G*255 + GetRawVolume(),game.Players.LocalPlayer.Character.Torso.Color.B*255 + GetRawVolume())
else
ColorXD = NormalizedColor(CustomColor.R*255 + GetRawVolume(),CustomColor.G*255 + GetRawVolume(),CustomColor.B*255 + GetRawVolume())
end
end

for i,v in pairs(Parts) do
	if v and v.Parent ~= nil then
		spawn(function()
			if CustomMode==1 then
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=v,["Color"]=NormalizedColor(math.random(0,255),math.random(0,255),math.random(0,255))})
			else
			Paint:WaitForChild("Remotes",1).ServerControls:InvokeServer("PaintPart",{["Part"]=v,["Color"]=ColorXD})
			end
		end)
	end
end
end) wait(UpdTime) until not Loops.partvisualizer

LoadParts()
else GUI:SendMessage(ScriptName, "This command does not work without Person's Admin.") end
end)

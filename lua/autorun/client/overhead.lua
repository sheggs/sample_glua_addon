local playerlistofgangs = {}

net.Receive("ReturingPlayerGangDataz",function ()
	print("TTTEIOADSH")
    playerlistofgangs = net.ReadTable()
	end)

local fontName = 'OSXTag'
local baseFont = 'Tahoma'

surface.CreateFont(fontName, {font = baseFont, size = 100, weight = 800, antialias = true, extended = true})
surface.CreateFont(fontName .. 'l', {font = baseFont, size = 75, weight = 800, antialias = true, extended = true})


local angles = Angle(0, 0, 90)
local shownametagsConVar = CreateClientConVar('aonis_drawnames', '1', true)

local offset = 18
local eyepos = Vector()
local eyeang = Vector()




hook.Add('RenderScene', 'NameTagsZZASDZ', function(pos, ang)
	eyepos = pos
	eyeang = ang
end)

local function getHeadPosition(ent)
	if not ent then return Vector(0, 0, 0), Angle(0, 0, 0) end

	local pos = ent:EyePos()
	local bone = ent:LookupBone('ValveBiped.Bip01_Head1')
	local model = ent:GetModel()
	if bone and not model:find('fast') then 
		pos = ent:GetBonePosition(bone)
	end
	pos = pos + ent:GetUp() * offset		
	return pos
end

local function drawText(text, font, x, y, color)
	draw.SimpleText(text, font, x + 3, y + 3, Color(0, 0, 0, 190), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	return draw.SimpleText(text, font, x, y, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
end

local function drawIcon(x, y, size, material, color)
	surface.SetMaterial(material)
	surface.SetDrawColor(Color(0, 0, 0, 190))
	surface.DrawTexturedRect(x + 2, y + 2, size, size)

	surface.SetMaterial(material)
	surface.SetDrawColor(color)
	surface.DrawTexturedRect(x, y, size, size)
end


local function drawNameTag(client,gangname,color)
	local headPosition = getHeadPosition(client) + Vector(0,0,4)
	local clientTeam = client:Team()
	local teamName = team.GetName(clientTeam)
	local size = 0.4 * client:GetModelScale() * 0.1

	local time = RealTime()
	
	angles.p = eyeang.p
	angles.y = eyeang.y
	angles.r = eyeang.r
	angles:RotateAroundAxis(angles:Up(), -90)
	angles:RotateAroundAxis(angles:Forward(), 90)
	
	cam.Start3D2D(headPosition, angles, size)
        	    if LocalPlayer():GetPos():Distance(client:GetPos()) <700 then
    		local w, h = drawText(string.gsub( gangname, "^.", string.upper ), fontName .. 'l',  0, 100,color)
    		end
	cam.End3D2D()
end


local players = {}

hook.Add('PostDrawTranslucentRenderables', 'NameTagsZZASDZ', function()

		if not shownametagsConVar:GetBool() then return end
	for index, client in pairs(player.GetAll()) do
		if client == LocalPlayer() then continue end
		if not players[client] then continue end 
		players[client] = false
		client.PixelVisible = client.PixelVisible or util.GetPixelVisibleHandle()
		if util.PixelVisible(client:EyePos(), 32, client.PixelVisible) > 0 then
	for k,v in pairs(playerlistofgangs) do
		if v.playerent == client then
			GangNameZ =  v.gangname	
			if v.redval == nil then
			    GangColor = Color(0,0,0)
			  else
			GangColor = Color(tonumber(v.redval),tonumber(v.greenval),tonumber(v.blueval))
			   end
			  

	end

end
if GangNameZ == nil then
    GangNameZ = ""
end
drawNameTag(client,GangNameZ,GangColor)


		end
	end		
end)

hook.Add('PostPlayerDraw', 'NameTagsZZASDZ', function(client)
	players[client] = true
end)




/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/
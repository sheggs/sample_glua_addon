util.AddNetworkString("DuplicateGang")
util.AddNetworkString("SendingPotentialGang")
util.AddNetworkString("RequestingPlayersGang")
util.AddNetworkString("SendingGangInfo")
util.AddNetworkString("Kickingplayerfromgang")
util.AddNetworkString("PlayerRemoved")
util.AddNetworkString("InvitingPlayerToGang")
util.AddNetworkString("RecievedGangInvite")
util.AddNetworkString("AcceptedInvite")
util.AddNetworkString("RequestingListOfPlayersInGang")
util.AddNetworkString("ReturningListOfPlayerNotInGang")
util.AddNetworkString("RequestingPlayerGangData")
util.AddNetworkString("ReturingPlayerGangDataz")
util.AddNetworkString("DisbandingGang")
util.AddNetworkString("GangCreationSuccesful")
util.AddNetworkString("GangDeletionSuccesful")
util.AddNetworkString("LeaveGang")
util.AddNetworkString("GetHoloColour")
util.AddNetworkString("ReturningColorsToClient")


function BlackRPRetrieveGangColor(gangname)
	return file.Read("gangs/" .. gangname  "/" .. gangname .. ".txt",  "DATA")
end

function BlackRPRetrieveGangMembers(gangname)
local subfiles, subdirs = file.Find("gangs/"..gangname.."/*","DATA")
return subfiles
end

function BlackRPRetrieveRankGang(gangname,ply)
	return tonumber(file.Read("gangs/" .. gangname ..  "/" .. ply:SteamID64() .. ".txt",  "DATA"))
end

function DoesGangExist(gangname)
	if (file.IsDir("gangs/"..gangname,"DATA")) then
		return true
	else
	    end

end
function BlackRPCreateGang(ply,color,gangname)
		file.CreateDir( "gangs/"..gangname )
		file.Write("gangs/" .. gangname.. "/" .. ply ..".txt",2)
		file.Write("gangs/" .. gangname .. "/" ..gangname .. ".txt",color)
		file.Write("gangs/test.txt",0)
end

function BlackRPJoinGang(gangname, ply)
	if (file.Exists("gangs/" .. gangname.. "/" .. ply:SteamID64()..".txt","DATA")) then
		
	else
	if BlackRPIsPlayerInGang(ply) then
	else
file.Write("gangs/" .. gangname.. "/" .. ply:SteamID64()..".txt",0)
end
end
end


function BlackRPDeleteGang(gangname1)
	if (file.IsDir("gangs/".. gangname1,"DATA")) then
		local subfiles, subdirs = file.Find("gangs/"..gangname1.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				file.Delete( "gangs/".. gangname1 .. "/" .. v_)
		end

end
file.Delete( "gangs/".. gangname1)
end



function BlackRPIsPlayerInGang(ply)
local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..v.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				if v_ == ply:SteamID64()..".txt" then 
					return true
				end
		end
	end


end

function BlackRPLeaveGang(ply)
local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..v.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				if v_ == ply:SteamID64()..".txt" then 
					file.Delete( "gangs/".. v .. "/" .. v_)
				end
		end
	end


end



function BlackRPGettingGangInfo(ply)
local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..v.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				if v_ == ply:SteamID64()..".txt" then 
					local colortabel = file.Read("gangs/" .. v ..  "/" .. v .. ".txt",  "DATA")
					local redval = 0
					local blueval = 0
					local grenval = 0
					for k,v in pairs(string.Split(colortabel,";")) do
						if k == 1 then
							redval = v
						end
						if k == 2 then 
							greenval = v
						end
						if k == 3 then 
							blueval = v 
						end
					end
					return v,redval,blueval,greenval
				end
		end
	end


end

function BlackRPRetrieveGang(ply)
local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..v.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				if v_ == ply:SteamID64()..".txt" then 
					return v
				end
		end
	end


end
	 redval =  0
	 greenval = 0
	 blueval =  0
net.Receive("SendingPotentialGang",function (len,caller)
	local GangColor = ""
	local GangColorTable = net.ReadTable()
		local GangName1 = net.ReadString()
		local GangName = string.lower(GangName1)
		local vinital = true
	for k,v in pairs(GangColorTable) do 
		if k == "r" then
			redval = v 
		end
		if k == "g" then
			greenval = v
		end
		if k == "b" then
			blueval = v
		end
	end
		GangColor = redval .. ";" .. greenval .. ";" .. blueval 
	if caller:getDarkRPVar( "money" ) > 50000 then
	if DoesGangExist(GangName) == true then
		caller:SendLua("chat.AddText(Color(225,0,0,255),[[[BlackRP] ]],Color(255,255,255,255),[[Duplicate Gang.]])")
		net.Start("DuplicateGang")
		net.Send(caller)
	else
	caller:addMoney(-50000)
	local callerssteamid = caller:SteamID64()
	BlackRPCreateGang(callerssteamid,GangColor,GangName) 
	net.Start("GangCreationSuccesful")
	net.Send(caller)
	print(GangColor)

	end
else 
			caller:SendLua("chat.AddText(Color(225,0,0,255),[[[BlackRP] ]],Color(255,255,255,255),[[You cannot afford to create a gang.]])")
end






	end)


timer.Create("BLACKRPTIMERGANG",30,0, function()
net.Start("ReturingPlayerGangDataz")
local tableofplayergangs = {}
for k,v in pairs(player.GetAll()) do
local gangname,redval,blueval,greenval = BlackRPGettingGangInfo(v)
table.insert(tableofplayergangs,{playerent = v, gangname = gangname, redval = redval, blueval = blueval, greenval = greenval})
end
net.WriteTable(tableofplayergangs)
net.Broadcast()

end)










net.Receive("RequestingPlayersGang",function (len,caller)
local tablemembers = {}
local gang_name = "0"
local steamidofmember = "0"
local gangrank = "0"
local membersrank = "0"
local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..v.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				if v_ == caller:SteamID64()..".txt" then 
						gang_name = v
						gangrankplayer = BlackRPRetrieveRankGang(gang_name,caller)
				end
		end
	end

if gang_name == "0" then
	print("Has no gang present")
	net.Start("SendingGangInfo")
	net.WriteBool(false)
	net.Send(caller)
else

local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..gang_name.."/*","DATA")
				for k_,v_ in pairs(subfiles) do 

			if string.lower(v_) == string.lower(v) ..".txt" then
			else
			membersrank = (file.Read("gangs/" .. v ..  "/" .. v_,  "DATA"))
			table.insert(tablemembers,{steamidtxt = v_, rank = membersrank})
			end
		end
	end
PrintTable(tablemembers)
net.Start("SendingGangInfo")
net.WriteBool(true)
net.WriteTable(tablemembers)
net.WriteString(gang_name)
net.WriteString(gangrankplayer)
net.Send(caller)

end
	end)
net.Receive("Kickingplayerfromgang",function (len,caller)
	print(caller:SteamID64())
	local textfile = net.ReadString()
	local gangname = net.ReadString()
	local files, dir = file.Find("gangs/*","DATA")
		for k,v in pairs(dir) do
		local subfiles, subdirs = file.Find("gangs/"..v.."/*","DATA")
		for k_,v_ in pairs(subfiles) do 
				if v_ == caller:SteamID64()..".txt" then 
					gangverfication = v
				end
		end
	end
	if gangverfication == gangname then
		file.Delete( "gangs/".. gangname .. "/" .. textfile)
	end
	for k,v in pairs(player.GetAll()) do
	    if v:SteamID64() .. ".txt" == textfile then
	        v:SendLua("chat.AddText(Color(225,0,0,255),[[[BlackRP] ]],Color(255,255,255,255),[[You have been kicked from the gang.]])")
        end
    end
	net.Start("PlayerRemoved")
	net.Send(caller)

	end)




net.Receive("InvitingPlayerToGang",function (len,caller)
local invitedplayer = 0
local invitedplayer = net.ReadEntity()
print(BlackRPIsPlayerInGang(invitedplayer))
net.Start("RecievedGangInvite")
net.WriteString(BlackRPRetrieveGang(caller))
net.Send(invitedplayer)
	end)



net.Receive("AcceptedInvite",function (len,caller)
local acceptedgangname = net.ReadString()
BlackRPJoinGang(acceptedgangname, caller)
	end)



net.Receive("RequestingListOfPlayersInGang",function (len,caller)
	PlayersNotInGang = {}
	for k,v in pairs(player.GetAll()) do
		if BlackRPIsPlayerInGang(v) then
		else
		table.insert(PlayersNotInGang,v)
	end
end
	net.Start("ReturningListOfPlayerNotInGang")
	net.WriteTable(PlayersNotInGang)
	net.Send(caller)
	end)


net.Receive("DisbandingGang",function(len,caller)
	local gangnamee = net.ReadString()
	BlackRPDeleteGang(gangnamee)
	net.Start("GangDeletionSuccesful")
	net.Send(caller)
	end)

net.Receive("LeaveGang",function(len,caller)
	BlackRPLeaveGang(caller)
	net.Start("GangDeletionSuccesful")
	net.Send(caller)
end)








hook.Add("PlayerSay", "BlackRPGang", function(ply, txt, team)
	if string.sub(txt, 1, 5) == "!gang" then
		local textofmember = string.sub(txt,7)
		local v,redval,blueval,greenval = BlackRPGettingGangInfo(ply)
		local coloroftext = "Color(255,255,255,255)"
		if BlackRPRetrieveRankGang(v,ply) == 2 then
			 coloroftext = "Color(63, 115, 198)"
		end
        local playersay22 = false

		if BlackRPIsPlayerInGang(ply) then
		    local v,redval,blueval,greenval = BlackRPGettingGangInfo(ply)
		local ColorTable = "Color(" .. tonumber(redval) .. "," .. tonumber(greenval) .. "," ..tonumber(blueval) .. ")"
				local gangname = BlackRPRetrieveGang(ply)	
				local tableofmembers = BlackRPRetrieveGangMembers(gangname)
				for k,v in pairs(tableofmembers) do 
					for k_,v_ in pairs(player.GetAll()) do
						if v_:SteamID64() .. ".txt" == v then
							v_:SendLua("chat.AddText(".. ColorTable ..",[[[".. string.gsub( gangname, "^.", string.upper ) .. "] ]],".. coloroftext .. ",[[" .. ply:Nick() .. ": " .. textofmember .. "]])")
							playersay22 = true
						end
					end
				end
		else
			ply:SendLua("chat.AddText(Color(225,0,0,255),[[[BlackRP] ]],Color(255,255,255,255),[[You cannot use !g if you are not in a gang.]])")
				return ""
		end
end
if string.sub(txt, 1, 5) == "!gang" then
    return ""
end
	end)


net.Receive("GetHoloColour",function (len,caller)
	local v,redval,blueval,greenval = BlackRPGettingGangInfo(caller)
	net.Start("ReturningColorsToClient")
	net.WriteString(redval)
	net.WriteString(blueval)
	net.WriteString(greenval)
	net.Send(caller)
end)
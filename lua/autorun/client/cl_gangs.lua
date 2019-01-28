surface.CreateFont( "selectormain", {
	font = "Open Sans", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "selectormain2", {
	font = "Open Sans", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	bold = true,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont( "selectormain3", {
	font = "Open Sans", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 15,
	bold = true,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
surface.CreateFont( "Description", {
	font = "Open Sans", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	bold = true,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )







local menucontent = {
	{
		title = "",
		locationaliggnment = 5,
		widthbutton = 140,
				openup = function ()
			end
	},
	{
		title = "",
		locationaliggnment =5,
		widthbutton = 140,
						openup = function ()
			end
	},
	{
		title = "",
		 locationaliggnment = 5,
		widthbutton = 140,
						openup = function ()
			end
	},
		{
		title = "",
		 locationaliggnment = 5,
		widthbutton = 140,
				openup = function ()
			end
	},


}




function DoesNotOwnGang()
local GangPanel = vgui.Create("DFrame")
GangPanel:SetSize(1478/2,1103/2)
GangPanel:Center()
GangPanel:SetTitle("")
GangPanel:MakePopup()

GangPanel.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(105,105,105))

end
local GangPanelTitle = vgui.Create("DLabel",GangPanel)
GangPanelTitle:SetPos(0,0)
GangPanelTitle:SetSize(1478/2,80)
GangPanelTitle:SetContentAlignment(5)
GangPanelTitle:SetFont("selectormain")
GangPanelTitle:SetText("BlackRP Gang Hub")





local GangPanelInformation = vgui.Create("DLabel",GangPanel)
GangPanelInformation:SetPos(0,80)
GangPanelInformation:SetSize(1478/2,200)
GangPanelInformation:SetContentAlignment(8)
GangPanelInformation:SetFont("selectormain2")
GangPanelInformation:SetText([[Our system currently sees that you are not part of any gang. If you would want to join one you must request 
	the gang owner to invite you. Otherwise you can create your own gang by setting your gang colour and 
	selecting a gang name.]])

local MixerFrame = vgui.Create("DLabel",GangPanel)
MixerFrame:SetPos(20,150)
MixerFrame:SetText([[Select a colour for your gang. This is permenant.
 You cannot change this.]])
MixerFrame:SetFont("selectormain3")
MixerFrame:RequestFocus()
MixerFrame:SetTextColor(Color(0,0,0))
MixerFrame:SetContentAlignment(8)
MixerFrame:SetSize(300,270)
MixerFrame.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255))

end


local GangNameEntryPanel = vgui.Create("DLabel",GangPanel)
GangNameEntryPanel:SetPos(350,150)
GangNameEntryPanel:SetText([[Enter the gang name you want. 
	If it the name is already taken there will be no transaction.]])
GangNameEntryPanel:SetFont("selectormain3")
GangNameEntryPanel:SetTextColor(Color(0,0,0))
GangNameEntryPanel:SetContentAlignment(8)
GangNameEntryPanel:SetSize(300,270)
GangNameEntryPanel.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255))

end



local TextEntryGang = vgui.Create("DTextEntry",GangPanel)
TextEntryGang:SetPos(380,200)
TextEntryGang:SetContentAlignment(8)
TextEntryGang:SetSize(200,20)
TextEntryGang:RequestFocus()

local Mixer = vgui.Create( "DColorMixer", GangPanel )
Mixer:SetPos(40,180)		--Make Mixer fill place of Frame
Mixer:SetPalette( true ) 		--Show/hide the palette			DEF:true
Mixer:SetAlphaBar( true ) 		--Show/hide the alpha bar		DEF:true
Mixer:SetWangs( true )			--Show/hide the R G B A indicators 	DEF:true
Mixer:SetColor( Color( 30, 100, 160 ) )	--Set the default color


local GangCreationButton = vgui.Create("DButton",GangPanel)
GangCreationButton:SetSize(400,100)
GangCreationButton:SetPos(1478/8,1103/2-120)
GangCreationButton:SetContentAlignment(5)
GangCreationButton:SetText("Create a gang for $50,000")
GangCreationButton:SetFont("selectormain2")
GangCreationButton:SetTextColor(Color(255,255,255))
GangCreationButton.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(60,179,113))
		if GangCreationButton:IsHovered() then
		draw.RoundedBox(0,0,0,w,h,Color(143,188,143))
	else
			draw.RoundedBox(0,0,0,w,h,Color(60,179,113))

	end

end
GangCreationButton.DoClick = function()
if string.len(TextEntryGang:GetValue()) < 9 then
local pattern = '[%A]' 
if string.find( TextEntryGang:GetValue(), pattern) == nil then
net.Start("SendingPotentialGang")
	net.WriteTable(Mixer:GetColor())
	net.WriteString(TextEntryGang:GetValue())
net.SendToServer()

else
local NameInvalidChar = vgui.Create("DLabel",GangPanel)
NameInvalidChar:SetPos(0,30)
NameInvalidChar:SetSize(1478/2,80)
NameInvalidChar:SetContentAlignment(5)
NameInvalidChar:SetFont("selectormain")
NameInvalidChar:SetText("This gang name has invalid characters. Please try again.")
NameInvalidChar:SetTextColor(Color(255,0,0))
timer.Create("NameInvalidChar",7,1,function ()

		NameInvalidChar:Remove()

end)

end


else
local ErrorNameTooLong = vgui.Create("DLabel",GangPanel)
ErrorNameTooLong:SetPos(0,30)
ErrorNameTooLong:SetSize(1478/2,80)
ErrorNameTooLong:SetContentAlignment(5)
ErrorNameTooLong:SetFont("selectormain")
ErrorNameTooLong:SetText("This gang name is too long it must be 8 characters`")
ErrorNameTooLong:SetTextColor(Color(255,0,0))
timer.Create("ERRORNAMETOLONG",7,1,function ()

		ErrorNameTooLong:Remove()

end)
end
end
/*
local ErrorDuplicateGang = vgui.Create("DLabel",GangPanel)
ErrorDuplicateGang:SetPos(0,30)
ErrorDuplicateGang:SetSize(1478/2,80)
ErrorDuplicateGang:SetContentAlignment(5)
ErrorDuplicateGang:SetFont("selectormain")
ErrorDuplicateGang:SetText("This gang name is already taken")
ErrorDuplicateGang:SetTextColor(Color(255,0,0))
*/
net.Receive("DuplicateGang",function (len,caller)

local ErrorDuplicateGang = vgui.Create("DLabel",GangPanel)
ErrorDuplicateGang:SetPos(0,30)
ErrorDuplicateGang:SetSize(1478/2,80)
ErrorDuplicateGang:SetContentAlignment(5)
ErrorDuplicateGang:SetFont("selectormain")
ErrorDuplicateGang:SetText("The gang name:" .. TextEntryGang:GetValue() .. " is already taken")
ErrorDuplicateGang:SetTextColor(Color(255,0,0))
timer.Create("Duplicate",7,1,function ()

		ErrorDuplicateGang:Remove()

end)
end)
net.Receive("GangCreationSuccesful",function ()
	print("succ")
	GangPanel:Close()
	end)
end




function GangMember()
local GangMemberScreen = vgui.Create("DFrame")
GangMemberScreen:SetSize(1478/2,1103/2)
GangMemberScreen:Center()
GangMemberScreen:SetTitle("")
GangMemberScreen:MakePopup()

GangMemberScreen.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(105,105,105))

end

net.Receive("GangDeletionSuccesful",function ()
	GangMemberScreen:Close()
	print("ggasdas")
	end)
local GangMemberScreenTit = vgui.Create("DLabel",GangMemberScreen)
GangMemberScreenTit:SetPos(0,0)
GangMemberScreenTit:SetSize(1478/2,80)
GangMemberScreenTit:SetContentAlignment(5)
GangMemberScreenTit:SetFont("selectormain")
GangMemberScreenTit:SetText(gangnamez)
GangMemberScreenTit:SetTextColor(Color(255,255,255))


local GangMemberListScroll = vgui.Create("DScrollPanel",GangMemberScreen)
GangMemberListScroll:SetPos(0,60)
GangMemberListScroll:SetSize(1478/2,1103/2 - 60)
GangMemberListScroll.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(105,105,105))

end

local GangPanelInformation = vgui.Create("DLabel",GangMemberListScroll)
GangPanelInformation:SetPos(0,10)
GangPanelInformation:SetSize(1478/2,1103/2 )
GangPanelInformation:SetContentAlignment(8)
GangPanelInformation:SetFont("selectormain2")
GangPanelInformation:SetText([[Welcome to your gang menu. Here you can view other members of the gang.]])
local heightposition = 50
for k,v in pairs(gangtablez) do
local isonline = false
local playername = v.steamidtxt
GangSeperationPanel = vgui.Create("DLabel",GangMemberListScroll)
GangSeperationPanel:SetSize(1478/2-100,50)
GangSeperationPanel:SetPos(50,heightposition)
GangSeperationPanel:SetText("")
GangSeperationPanel.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255))
end
for k,v_ in pairs(player.GetAll()) do
	if v_:SteamID64()..".txt" == v.steamidtxt then
		playername = v_:Nick()
		isonline = true
	end
end
GangMemberName = vgui.Create("DLabel",GangSeperationPanel)
GangMemberName:SetSize(250,50)
GangMemberName:SetPos(0,0)
GangMemberName:SetText("Name: " .. playername )
GangMemberName:SetContentAlignment(4)
GangMemberName:SetFont("selectormain2")
GangMemberName:SetTextColor(Color(0,0,0))
GangMemberName.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(255,255,255))
end


local LeaveGang = vgui.Create("DButton",GangMemberScreen)
	LeaveGang:SetText("Leave Gang")
	LeaveGang:SetSize(100,30)
	LeaveGang:SetTextColor(Color(255,255,255))
	LeaveGang:SetContentAlignment(5)
	LeaveGang:SetPos(500,10)
	LeaveGang:SetFont("selectormain2")
	LeaveGang.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if LeaveGang:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end



LeaveGang.DoClick = function()
net.Start("LeaveGang")
net.WriteString(gangnamez)
net.SendToServer()

end

IsGangMemberOnline = vgui.Create("DLabel",GangSeperationPanel)
IsGangMemberOnline:SetSize(100,50)
IsGangMemberOnline:SetPos(200,0)

IsGangMemberOnline:SetContentAlignment(5)
if isonline then
IsGangMemberOnline:SetTextColor(Color(0,255,0))
IsGangMemberOnline:SetText("Online")
else
IsGangMemberOnline:SetTextColor(Color(255,0,0))
IsGangMemberOnline:SetText("Offline")
end

IsGangMemberOnline:SetFont("selectormain2")

if tonumber(gangzrank) == 2 then

local DisbandGang = vgui.Create("DButton",GangMemberScreen)
	DisbandGang:SetText("Disband Gang")
	DisbandGang:SetSize(100,30)
	DisbandGang:SetTextColor(Color(255,255,255))
	DisbandGang:SetContentAlignment(5)
	DisbandGang:SetPos(500,10)
	DisbandGang:SetFont("selectormain2")
	DisbandGang.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if DisbandGang:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end
DisbandGang.DoClick = function()
net.Start("DisbandingGang")
net.WriteString(gangnamez)
net.SendToServer()

end


local KickPlayer = vgui.Create("DButton",GangMemberListScroll)
	KickPlayer:SetText("Kick")
	KickPlayer:SetSize(80,50)
	KickPlayer:SetTextColor(Color(255,255,255))
	KickPlayer:SetContentAlignment(5)
	KickPlayer:SetPos(1478/2-100,heightposition)
	KickPlayer:SetFont("selectormain2")
	KickPlayer.Paint = function(s,w,h)

		draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if KickPlayer:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end
	KickPlayer.DoClick = function()
	    
	if v.rank == "2" then
		chat.AddText(Color(225,0,0,255),[[[BlackRP] ]],Color(255,255,255,255),[[You cannot kick the owner of the gang.]])
	else
			net.Start("Kickingplayerfromgang")
		net.WriteString(v.steamidtxt)
		net.WriteString(gangnamez)
	net.SendToServer()
end
	if v.steamidtxt == LocalPlayer():SteamID64() ..".txt" then
		chat.AddText(Color(225,0,0,255),[[[BlackRP] ]],Color(255,255,255,255),[[You cannot kick yourself out the gang. Please leave the gang by using the leave gang button.]])

	else
		net.Start("Kickingplayerfromgang")
		net.WriteString(v.steamidtxt)
		net.WriteString(gangnamez)
	net.SendToServer()
end
GangMemberScreen:Close()
end
local InviteGang = vgui.Create("DButton",GangMemberScreen)
	InviteGang:SetText("Invite Players")
	InviteGang:SetSize(100,30)
	InviteGang:SetTextColor(Color(255,255,255))
	InviteGang:SetContentAlignment(5)
	InviteGang:SetPos(120,10)
	InviteGang:SetFont("selectormain2")
	InviteGang.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if InviteGang:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end
InviteGang.DoClick = function()
net.Start("RequestingListOfPlayersInGang")
net.SendToServer()

net.Receive("ReturningListOfPlayerNotInGang",function ()
local listofplayers = net.ReadTable()
PrintTable(listofplayers)
print("test")

local inviteframe = vgui.Create("DFrame",GangMemberScreen)
inviteframe:SetSize(300,300)
inviteframe:Center()
inviteframe:SetTitle("Invite Players")
inviteframe.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(150,105,105))
end
local ComoBoxINvite = vgui.Create( "DComboBox" ,inviteframe)
ComoBoxINvite:SetPos( 300/6, 50 )
ComoBoxINvite:SetSize( 200, 40 )
ComoBoxINvite:SetValue( "List of Players" )
for k,v in pairs(listofplayers) do
ComoBoxINvite:AddChoice( v:Nick())
end
ComoBoxINvite.OnSelect = function( panel, index, value )
	print( value .." was selected!" )

local playerentity = "0"
local InvitePlayerButton = vgui.Create("DButton",inviteframe)
for k,v in pairs(player.GetAll()) do
	if v:Nick() == value then
		playerentity = v
	end
end
	InvitePlayerButton:SetText("Invite: " .. value)
	InvitePlayerButton:SetSize(280,80)
	InvitePlayerButton:SetTextColor(Color(255,255,255))
	InvitePlayerButton:SetContentAlignment(5)
	InvitePlayerButton:SetPos(10,200)
	InvitePlayerButton:SetFont("selectormain2")
	InvitePlayerButton.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if InvitePlayerButton:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end
		InvitePlayerButton.DoClick = function()
			net.Start("InvitingPlayerToGang")
			net.WriteEntity(playerentity)
			net.SendToServer()
		end

end


	end)



end








































local GangSettings = vgui.Create("DButton",GangMemberScreen)
	GangSettings:SetText("Settings")
	GangSettings:SetSize(100,30)
	GangSettings:SetTextColor(Color(255,255,255))
	GangSettings:SetContentAlignment(5)
	GangSettings:SetPos(10,10)
	GangSettings:SetFont("selectormain2")
	GangSettings.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if GangSettings:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end
GangSettings.DoClick = function()


	local gangsettingsframe = vgui.Create("DFrame",GangMemberScreen)
gangsettingsframe:SetSize(300,300)
gangsettingsframe:Center()
gangsettingsframe:SetTitle("Settings")
gangsettingsframe.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(150,105,105))

end


local TestingForm = vgui.Create( "DForm", gangsettingsframe )
TestingForm:SetSize(300,300)
TestingForm:SetSpacing( 10 )
TestingForm:SetPos(0,40)
TestingForm:SetName( "Gang Settings" )
TestingForm.Paint = function()
    surface.SetDrawColor( 255, 51, 15, 255 )
    -- I draw a box here to show where the form is outlined
    surface.DrawOutlinedRect( 0, 0, TestingForm:GetWide(), TestingForm:GetTall() ) 
end
 local FormContentOne = vgui.Create( "DCheckBoxLabel" ,TestingForm)
    FormContentOne:SetText( "Friendly Fire" )
    FormContentOne:SetValue( 1 )
    FormContentOne:SizeToContents()
TestingForm:AddItem( FormContentOne )
 


end
end
heightposition = heightposition + 60
end

end

function StartGangScreen()
net.Start("RequestingPlayersGang")
net.SendToServer()

net.Receive("SendingGangInfo",function ()
	gangtablez = {}
	gangnamez = "0"
	gangzrank = 0
	gangbool = net.ReadBool()
   	if gangbool then
   		gangtablez = net.ReadTable()
   		gangnamez = net.ReadString()
   		gangzrank = net.ReadString()
    for k,v in pairs(gangtablez) do
        if v.steamidtxt == gangnamez .. ".txt" then
            table.remove(gangtablez,k)
        end
end




for k,v in pairs(gangtablez) do
    for k_,v_ in pairs(gangtablez) do
            if v.steamidtxt == v_.steamidtxt then
                if k_ != k then
           table.remove(gangtablez,k_)
           end
        
    end
end
end





    PrintTable(gangtablez)
   		
   		GangMember()
   	else
   		print("No Gang")
   		DoesNotOwnGang()
   	end



	end)
end

net.Receive("PlayerRemoved",function ()
	net.Start("RequestingPlayersGang")
	net.SendToServer()
	end)




/*net.Start("SendingPotentialGang")
	net.WriteTable(Mixer:GetColor())
	net.WriteString(TextEntryGang:GetValue())
net.SendToServer()

else
local NameInvalidChar = vgui.Create("DLabel",GangPanel)
NameInvalidChar:SetPos(0,30)
NameInvalidChar:SetSize(1478/2,80)
NameInvalidChar:SetContentAlignment(5)
NameInvalidChar:SetFont("selectormain")
NameInvalidChar:SetText("This gang name has invalid characters. Please try again.")
NameInvalidChar:SetTextColor(Color(255,0,0))
timer.Create("NameInvalidChar",7,1,function ()

		NameInvalidChar:Remove()

end)

end*/

 timer.Create("Gang Halo", 60, 0, function ()

net.Start("RequestingPlayersGang")
net.SendToServer()

net.Receive("SendingGangInfo",function ()
	gangtablez = {}
	gangnamez = "0"
	gangzrank = 0
	gangbool = net.ReadBool()
   	if gangbool then
   		gangtablez = net.ReadTable()
   		gangnamez = net.ReadString()
   		gangzrank = net.ReadString()
    for k,v in pairs(gangtablez) do
        if v.steamidtxt == gangnamez .. ".txt" then
            table.remove(gangtablez,k)
        end
	end
	local realEntityGangs = {}
	for k,v in pairs(player.GetAll()) do
		if v.SteamID64() .. ".txt" == v.steamidtxt then
  			table.insert(realEntityGangs, v )
		end
	end
	net.Start("GetHoloColour")
	net.WriteString("gangnamez")
	net.SendToServer()
	local redval = 0
	local blueval = 0
	local greenval = 0
	net.Receive("ReturningColorsToClient",function ()
		redval = net.ReadString()
		blueval = net.ReadString()
		greenval = net.ReadString()
	hook.Add( "PreDrawHalos", "AddStaffHalos", function()
		halo.Add( realEntityGangs, Color( tonumber(redval), tonumber(greenval), tonumber(blueval) ), 0, 0, 2, true, true )
	end )
	end)


end




	end)
end)
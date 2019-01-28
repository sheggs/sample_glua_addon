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


function Invitation(gangname)

local InvitationFrame = vgui.Create("DFrame")
InvitationFrame:SetSize(200,200)
InvitationFrame:SetPos(ScrW()-200,100)
local InvitationText = vgui.Create("DLabel",InvitationFrame)
InvitationText:SetSize(200,100)
InvitationText:SetPos(5,10)
InvitationText:SetText([[You have been invited to join
 ]] .. gangname)
InvitationText:SetFont("selectormain3")



local AcceptButton = vgui.Create("DButton",InvitationFrame)
	AcceptButton:SetText("Accept")
	AcceptButton:SetSize(100,30)
	AcceptButton:SetTextColor(Color(255,255,255))
	AcceptButton:SetContentAlignment(5)
	AcceptButton:SetPos(50,100)
	AcceptButton:SetFont("selectormain2")
	AcceptButton.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if AcceptButton:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(0,191,255))
		else
			draw.RoundedBox(0,0,0,w,h,Color(100,149,237))

		end
	end
AcceptButton.DoClick = function()
    InvitationFrame:Close()

net.Start("AcceptedInvite")
net.WriteString(gangname)
net.SendToServer()


end
local DenyButton = vgui.Create("DButton",InvitationFrame)
	DenyButton:SetText("Deny")
	DenyButton:SetSize(100,30)
	DenyButton:SetTextColor(Color(255,255,255))
	DenyButton:SetContentAlignment(5)
	DenyButton:SetPos(50,150)
	DenyButton:SetFont("selectormain2")
	DenyButton.Paint = function(s,w,h)
draw.RoundedBox(0,0,0,w,h,Color(255,0,0))
	
			if DenyButton:IsHovered() then
			draw.RoundedBox(0,0,0,w,h,Color(255,160,122))
		else
			draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		end
	end


DenyButton.DoClick = function()
InvitationFrame:Close()
end
end

net.Receive("RecievedGangInvite",function ()
	local gangname  = net.ReadString()
	print("GOTIT")
	Invitation(gangname)

	end)
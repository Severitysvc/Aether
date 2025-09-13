local Library = {}
Library.__index = Library

if shared.Aether then
	shared.Aether:Uninject(function()
		shared.Aether = Library
	end, function()
		return
	end)
end

function Library.New()
	local Self = setmetatable({}, Library)

	Self.Services = {
		RunService = game:GetService("RunService"),
		UserInputService = game:GetService("UserInputService"),
		TweenService = game:GetService("TweenService"),
		Players = game:GetService("Players"),
	}

	Self.CloneRef = cloneref or function(Item)
		return Item
	end

	Self.ProtectGui = protectgui or function() end

	Self.Require = function(Path)
		if Self.Services.RunService:IsStudio() then
			return require(Path)
		else
		end
	end

	Self.FontID = "rbxasset://fonts/families/GothamSSm.json"
	Self.Font = {
		SemiBold = Font.new(Self.FontID, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		Medium = Font.new(Self.FontID, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
	}

	Self.BackgroundImage = "rbxassetid://16255699706"
	Self.Mobile = false
	Self.Icons = nil

	Self.Creator = require("../build/Creator")
	Self.Animator = require("../build/Animator")
	Self.Signal = require("../build/Signal")

	Self.Components = {
		Window = require("./components/Window"),
		Navigator = require("./components/Navigator"),
		Notification = require("./components/Notification"),
	}

	Self.Elements = {
		Toggle = require("./elements/Toggle"),
		Slider = require("./elements/Slider"),
		Dropdown = require("./elements/Dropdown"),
	}

	return Self
end

function Library:Init(Data)
	local Hud

	local Services = self.Services
	local Components = self.Components
	local Creator = self.Creator

	local Notification = Components.Notification.New(self)
	Library.Notificator = Notification

	if Services.RunService:IsStudio() then
		Hud = Services.Players.LocalPlayer:WaitForChild("PlayerGui")
		self.Icons = { Icon = nil }
	else
		self.Icons = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua"))() --// Creds: .ftgs
		self.Icons.SetIconsType("lucide")

		Hud = gethui and gethui() or game:GetService("CoreGui")
	end

	assert(Hud, "No gui parent at :Setup")

	if
		Services.UserInputService.TouchEnabled
		and not Services.UserInputService.KeyboardEnabled
		and not Services.UserInputService.MouseEnabled
	then
		self.Mobile = true
	elseif
		not Services.UserInputService.TouchEnabled
		and Services.UserInputService.KeyboardEnabled
		and Services.UserInputService.MouseEnabled
	then
		self.Mobile = true
	end

	local AetherUI = Creator:New("ScreenGui", {
		Parent = Hud,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		Name = "Aether",
	}) :: ScreenGui

	local DropdownUI = Creator:New("Frame", {
		Parent = AetherUI,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Name = "DropdownUI",
		ZIndex = 2,
		Visible = true,
	})

	local PromptUI = Creator:New("Frame", {
		Parent = AetherUI,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		Name = "PromptUI",
		ZIndex = 2,
		Visible = true,
	})

	local NotificationUI = Creator:New("Frame", {
		Parent = AetherUI,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Name = "NotificationUI",
		ZIndex = 1,
		Visible = true,
	})

	self.ProtectGui(AetherUI)
	self.AetherUI = AetherUI
	self.DropdownUI = DropdownUI

	local Window = self.Components.Window.New(self):Init({
		WindowSize = Data.Window.WindowSize or Data.Window.Size or nil,
		Title = Data.Window.Title or Data.Window.Header or nil,
		Logo = Data.Window.Logo or Data.Window.Icon,
		TopBarBorder = Data.Window.ShowTopBarBorder or Data.Window.TopBarBorder,
	})

	Library.Window = Window

	local Navigator = Components.Navigator.New(self):Init({
		BarSection = Data.Navigator.BarSection or "Center",
		Profile = {
			Enabled = Data.Navigator.Profile.Enabled or false,
			HideName = Data.Navigator.Profile.HideName or false,
			HideThumbnail = Data.Navigator.Profile.HideThumbnail or false,
		},
	})

	return Navigator
end

function Library:GetIcon(IconName)
	assert(IconName, "No icon passed for 'GetIcon'")

	if type(IconName) == "string" and IconName:find("rbxassetid") then
		return {
			Image = IconName,
			ImageRectPosition = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
		}
	end

	local Icon = self.Icons.Icon and self.Icons.Icon(tostring(IconName):lower()) or nil

	if not Icon then
		return {
			Image = "rbxassetid://10723424646",
			ImageRectPosition = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0),
		}
	end

	return {
		Image = Icon[1],
		ImageRectSize = Icon[2].ImageRectSize,
		ImageRectPosition = Icon[2].ImageRectPosition,
	}
end

function Library:ChangeFont(Font, Weight)
	local Labels = self.Creator:GetTextLabels()
	Weight = Weight or Enum.FontWeight.Medium

	if typeof(Font) == "Font" then
		for _, Label in pairs(Labels) do
			Label.FontFace = Font
		end
	elseif type(Font) == "string" then
		if Font:find("rbxassetid") or Font:find("rbxasset://") then
			local NewFont = Font.new(Font, Weight, Enum.FontStyle.Normal)

			self.FontID = Font
			self.Font.Medium = Font.new(Font, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
			self.Font.SemiBold = Font.new(Font, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			self.Font.Bold = Font.new(Font, Enum.FontWeight.Bold, Enum.FontStyle.Normal)

			for _, Label in pairs(Labels) do
				Label.FontFace = NewFont
			end
		end
	end
end

function Library:ChangeIconLibrary(LibraryName)
	if self.Services.RunService:IsStudio() then
		return
	else
		if self.Icons then
			self.Icons.SetIconsType(LibraryName)
		end
	end
end

function Library:SetBackgroundImage(Image)
	assert(not Image:find("rbxassetid://"), "image must be a contentid for 'SetBackgroundImage'")

	local ImageInstances = self.Creator:GetImageInstances()

	for _, Instance in pairs(ImageInstances) do
		if Instance.Image == self.BackgroundImage then
			Instance.Image = Image
		end
	end

	self.BackgroundImage = Image
end

function Library:SetParent(Directory)
	assert(self.AetherUI or Directory, "'SetParent' failed")

	if self.AetherUI and Directory ~= nil then
		self.AetherUI.Parent = Directory
	end
end

function Library:SetBackgroundTransparency(Value)
	local ImageInstances = self.Creator:GetImageInstances()

	for _, Instance in pairs(ImageInstances) do
		Instance.ImageTransparency = Value
	end
end

function Library:Notify(Data)
	assert(Library.Notificator, "No notification module found at 'Notify'")

	local New = Library.Notificator:Init({
		Title = Data.Title or Data.Header or "",
		Content = Data.Content or "",
		Icon = Data.TitleIcon or Data.Icon or "",
		Duration = Data.Duration or 4,
	})

	return New
end

function Library:Uninject() end
return Library

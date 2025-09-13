local Library = {}
Library.__index = Library

if shared.Aether then
	shared.Aether:Uninject(function()
		shared.Aether = Library
	end)
end

function Library.new()
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
			local Parts = {}
			for Part in string.gmatch(Path, "[^/]+") do
				table.insert(Parts, Part)
			end

			local Path = script
			for _, Part in ipairs(Parts) do
				if Part == ".." then
					Path = Path.Parent
				elseif Part ~= "." then
					Path = Path:FindFirstChild(Part)
					assert(Path, "module '" .. Part .. "' not found at path: " .. Path)
				end
			end

			return require(Path)
		else
			local Extension = ".lua"
			return require(Path .. Extension)
		end
	end

	Self.Font = {
		ID = "rbxasset://fonts/families/GothamSSm.json",
		SemiBold = Font.new(Self.Font.ID, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		Medium = Font.new(Self.Font.ID, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
	}

	Self.Mobile = false

	Self.Creator = Self.Require("../build/Creator")
	Self.Animator = Self.Require("../build/Animator")
	Self.Signal = Self.Require("../build/Signal")

	Self.Components = {
		Window = Self.Require("./components/Window"),
		Navigator = Self.Require("./components/Navigator"),
	}

	Self.Icons = nil

	return Self
end

function Library:Setup(Data)
	local Methods = {}
	local Hud

	local Services = self.Services
	local Components = self.Components
	local Creator = self.Creator
	local Animator = self.Animator
	local Signal = self.Signal

	if Services.RunService:IsStudio() then
		Hud = Services.Players.LocalPlayer:WaitForChild("PlayerGui")
		self.Icons = { Icon = nil }
	else
		self.Icons = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua"))() --// Creds
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

	self.ProtectGui(AetherUI)
	self.AetherUI = AetherUI

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

	shared.Creator = Creator
	shared.Animator = Animator
	shared.Signal = Signal
	shared.IconLibrary = self.Icons

	local Navigator = Components.Navigator.New(self)

	Navigator:Init(Data.Navigator)

	function Methods:ChangeFont(Font, Weight)
		local Labels = Creator:GetTextLabels()
		Weight = Weight or Enum.FontWeight.Medium

		if typeof(Font) == "Font" then
			for _, Label in pairs(Labels) do
				Label.FontFace = Font
			end
		elseif type(Font) == "string" then
			if Font:find("rbxassetid") or Font:find("rbxasset://") then
				local NewFont = Font.new(Font, Weight, Enum.FontStyle.Normal)

				self.Font.ID = Font
				self.Font.Medium = Font.new(Font, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
				self.Font.SemiBold = Font.new(Font, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
				self.Font.Bold = Font.new(Font, Enum.FontWeight.Bold, Enum.FontStyle.Normal)

				for _, Label in pairs(Labels) do
					Label.FontFace = NewFont
				end
			end
		end
	end

	function Methods:ChangeIconLibrary(LibraryName)
		if Services.RunService:IsStudio() then
			return
		else
			if self.Icons then
				self.Icons.SetIconsType(LibraryName)
			end
		end
	end

	return Methods
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
			Image = "",
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

function Library:Uninject() end

return Library

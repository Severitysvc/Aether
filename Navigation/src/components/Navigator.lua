local Navigator = {}
Navigator.__index = Navigator

function Navigator.New(Library)
	local Self = setmetatable({}, Navigator)

	Self.Library = Library

	return Self
end

function Navigator:Init(Data)
	local Library = self.Library

	assert(Library, "no library found for 'Init' at Navigator.lua")

	local Creator = Library.Creator
	local Animator = Library.Animator
	local Signal = Library.Signal

	local Window = Library.Window

	assert(Window, "no window module found for 'Init' at Navigator.lua")

	local Creator = self.Library.Creator

	local NavigationBar = Creator:New("Frame", {
		Name = "NavigationBar",
		Parent = Library.AetherUI,
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, -0.146191642, 200),
	})

	Creator:New("UIListLayout", {
		Parent = NavigationBar,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	local Left_1 = Creator:New("Frame", {
		Name = "Left",
		Parent = NavigationBar,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.133982971, 0, -1.79012346, 0),
		Size = UDim2.new(0.333333343, 0, 1, 0),
	})

	local Center_1 = Creator:New("Frame", {
		Name = "Center",
		Parent = NavigationBar,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.299999863, 0),
		Size = UDim2.new(0.333333343, 0, 1, 0),
	})

	local Right_1 = Creator:New("Frame", {
		Name = "Right",
		Parent = NavigationBar,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.299999863, 0),
		Size = UDim2.new(0.333333343, 0, 1, 0),
	})

	local UIListLayout_2 = Creator:New("UIListLayout", {
		Parent = Left_1,
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
	})

	local UIPadding_1 = Creator:New("UIPadding", {
		Parent = Left_1,
		PaddingBottom = UDim.new(0, 12),
		--// PaddingLeft = UDim.new(0, 15),
	})

	if Library.Mobile == true then
		UIPadding_1.PaddingBottom = UDim.new(0, 10)
	end
end

return Navigator

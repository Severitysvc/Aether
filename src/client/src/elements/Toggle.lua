local Toggle = {}
Toggle.__index = Toggle

function Toggle.New(Library, Body)
	local Self = setmetatable({}, Toggle)

	Self.Library = Library
	Self.Body = Body

	return Self
end

function Toggle:Init(Data)
	local Library = self.Library

	assert(Library, "No library found for '" .. Data.Title .. ", ended thread")

	local Creator = Library.Creator
	local Animator = Library.Animator
	local Signal = Library.Signal

	local Toggle = Creator:New("Frame", {
		Name = Data.Title,
		Parent = self.Body,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BackgroundTransparency = 0.4,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.0259433966, 0, 0, 0),
		Size = UDim2.new(0.93, 0, 0, 0),
	})

	local Displays_1 = Creator:New("Frame", {
		Name = "Displays",
		Parent = Toggle,
		AnchorPoint = Vector2.new(0, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.0125523014, -6, 0.5, 0),
		Size = UDim2.new(0.763, 0, 0, 0),
	})

	local IconHolder_1 = Creator:New("Frame", {
		Name = "IconHolder",
		Parent = Displays_1,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(25, 25, 25),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 50, 0, 50),
		Visible = false,
	})

	local Icon = Library:GetIcon(Data.Icon)

	local Icon_1 = Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = IconHolder_1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 27, 0, 27),
		Image = Icon.Image,
		ImageRectOffset = Icon.ImageRectPosition,
		ImageRectSize = Icon.ImageRectSize,
	})

	Signal:HandleNil(Icon_1, IconHolder_1)

	Creator:New("UICorner", {
		Parent = IconHolder_1,
		CornerRadius = UDim.new(0, 15),
	})

	local Text_1 = Creator:New("Frame", {
		Name = "Text",
		Parent = Displays_1,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(0.279671192, 0, 1, 0),
		Position = UDim2.new(0.178094149, -6, 0, 0),
	})

	local UIListLayout_1 = Creator:New("UIListLayout", {
		Parent = Text_1,
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	local Display_1 = Creator:New("TextLabel", {
		Name = "Display",
		Parent = Text_1,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 17),
		FontFace = Library.Font.SemiBold,
		Text = Data.Title or "",
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = 18,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local Description_1 = Creator:New("TextLabel", {
		Name = "Description",
		Parent = Text_1,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Font = Enum.Font.GothamMedium,
		Text = Data.Description or "",
		TextColor3 = Color3.fromRGB(180, 180, 180),
		TextSize = 16,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
	})

	local UIListLayout_2 = Creator:New("UIListLayout", {
		Parent = Displays_1,
		Padding = UDim.new(0, 10),
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	local ToggleHolder_1 = Creator:New("Frame", {
		Name = "ToggleHolder",
		Parent = Toggle,
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Position = UDim2.new(0.735639036, 0, 0, 0),
		Size = UDim2.new(0, 110, 0, 45),
	})

	local Toggle_1 = Creator:New("Frame", {
		Name = "Toggle",
		Parent = ToggleHolder_1,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.9,
		Position = UDim2.new(0.522000015, 0, 0.5, 0),
		Size = UDim2.new(0, 55, 0, 30),
	})

	local UICorner_2 = Creator:New("UICorner", {
		Parent = Toggle_1,
		CornerRadius = UDim.new(1, 0),
	})

	local UIStroke_1 = Creator:New("UIStroke", {
		Parent = Toggle_1,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.85,
	})

	local Dot_1 = Creator:New("Frame", {
		Name = "Dot",
		Parent = Toggle_1,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(220, 220, 220),
		Position = UDim2.new(1, -5, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20),
	})

	Creator:New("UICorner", {
		Parent = Dot_1,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UIGradient", {
		Parent = Dot_1,
		Rotation = 90,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 0.26875),
		}),
	})

	Creator:New("UIListLayout", {
		Parent = ToggleHolder_1,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIStroke", {
		Parent = Toggle,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.9,
	})

	Creator:New("UICorner", {
		Parent = Toggle,
		CornerRadius = UDim.new(0, 20),
	})

	Creator:New("UIPadding", {
		Parent = Toggle,
		PaddingBottom = UDim.new(0, 15),
		PaddingLeft = UDim.new(0, 15),
		PaddingRight = UDim.new(0, 15),
		PaddingTop = UDim.new(0, 15),
	})

	Creator:New("UIListLayout", {
		Parent = Toggle,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
	})

	Signal:HandleNil(Icon_1, IconHolder_1)
	Signal:HandleNil(Display_1)
	Signal:HandleNil(Description_1)

	Signal:HandleChange(Displays_1, ToggleHolder_1)
	local ValueChanged = Signal:NewBind("ToggleValueChanged")

	--// self.Body = Toggle_1
	local function HandleTransition(Bool)
		ValueChanged:Fire(Bool)

		if Bool then
			Animator:Animate(Toggle_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0.9,
			})

			Animator:Animate(UIStroke_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Transparency = 0.85,
			})

			Animator:Animate(Dot_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0,
				Position = UDim2.new(1, -5, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
			})
		else
			Animator:Animate(Toggle_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0.98,
			})

			Animator:Animate(UIStroke_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Transparency = 0.9,
			})

			Animator:Animate(Dot_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundTransparency = 0.45,
				Position = UDim2.new(0, 5, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
			})
		end
	end

	local Default = Data.Default or false
	local Callback = Data.Callback

	local Bool = Default or false

	assert(Callback, "no callback for " .. Data.Title .. "")
	HandleTransition(Bool)

	Signal:NewClickSignal(Toggle_1, function()
		Bool = not Bool
		HandleTransition(Bool)

		Signal:SafeCallback(Callback, Bool, Data.Title)
	end)

	return {
		SetTitle = function(self, Text)
			Display_1.Text = tostring(Text)
		end,

		SetDescription = function(self, Text)
			Description_1.Text = Text
		end,

		SetValue = function(self, Value)
			HandleTransition(Value)
			Signal:SafeCallback(Callback, Bool, Data.Title)
			Bool = Value
		end,

		Binds = {
			OnValueChange = function(self, BindCallback)
				ValueChanged.Event:Connect(function()
					Signal:SafeCallback(BindCallback, Bool, Data.Title)
				end)
			end,
		},
	}
end

return Toggle

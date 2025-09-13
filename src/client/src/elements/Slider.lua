local Slider = {}
Slider.__index = Slider

function Slider.New(Library, Body)
	local Self = setmetatable({}, Slider)

	Self.Library = Library
	Self.Body = Body

	return Self
end

function Slider:Init(Data)
	local Library = self.Library

	assert(Library, "No library found for '" .. Data.Title .. ", ended thread")

	local Creator = Library.Creator
	local Animator = Library.Animator
	local Signal = Library.Signal

	local Slider = Creator:New("Frame", {
		Name = Data.Title,
		Parent = self.Body,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BackgroundTransparency = 0.4,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.0259433966, 0, 0, 0),
		Size = UDim2.new(0.93, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
	})

	local Displays = Creator:New("Frame", {
		Name = "Displays",
		Parent = Slider,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0125523014, -6, 0.5, 0),
		Size = UDim2.new(0.763, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
	})

	local IconHolder = Creator:New("Frame", {
		Name = "IconHolder",
		Parent = Displays,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(25, 25, 25),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 50, 0, 50),
		Visible = false,
	})

	local Icon2 = Library:GetIcon(Data.Icon) or ""

	local Icon = Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = IconHolder,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 27, 0, 27),
		Image = Icon2.Image,
		ImageTransparency = 0.3,
		ImageRectOffset = Icon2.ImageRectPosition,
		ImageRectSize = Icon2.ImageRectSize,
	})

	Signal:HandleNil(Icon, IconHolder)

	Creator:New("UICorner", {
		Parent = IconHolder,
		CornerRadius = UDim.new(0, 15),
	})

	local Text = Creator:New("Frame", {
		Name = "Text",
		Parent = Displays,
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Position = UDim2.new(0.178094149, -6, 0, 0),
		Size = UDim2.new(0.279671192, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
	})

	Creator:New("UIListLayout", {
		Parent = Text,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 5),
	})

	local Display = Creator:New("TextLabel", {
		Name = "Display",
		Parent = Text,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 17),
		FontFace = Library.Font.SemiBold,
		Text = Data.Title,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = 18,
		TextXAlignment = Enum.TextXAlignment.Left,
		AutomaticSize = Enum.AutomaticSize.Y,
	})

	Signal:HandleNil(Display)

	local Description = Creator:New("TextLabel", {
		Name = "Description",
		Parent = Text,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Font = Enum.Font.GothamMedium,
		Text = Data.Description,
		TextColor3 = Color3.fromRGB(180, 180, 180),
		TextSize = 16,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		AutomaticSize = Enum.AutomaticSize.Y,
	})

	Signal:HandleNil(Description)

	Creator:New("UIListLayout", {
		Parent = Displays,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 10),
	})

	local SliderHolder = Creator:New("Frame", {
		Name = "SliderHolder",
		Parent = Slider,
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Position = UDim2.new(0, 0, 0.820895493, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
	})

	Creator:New("UIPadding", {
		Parent = SliderHolder,
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 10),
	})

	Creator:New("UIListLayout", {
		Parent = SliderHolder,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
	})

	local SliderBar = Creator:New("TextButton", {
		Name = "SliderBar",
		Parent = SliderHolder,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.9,
		Position = UDim2.new(0, 0, 0.785714269, 0),
		Size = UDim2.new(0, 277, 0, 6),
		Text = "",
	})

	Creator:New("UICorner", {
		Parent = SliderBar,
		CornerRadius = UDim.new(1, 0),
	})

	local ProgressBar = Creator:New("Frame", {
		Name = "ProgressBar",
		Parent = SliderBar,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Size = UDim2.new(0.6, 0, 1, 0),
	})

	Creator:New("UIPadding", {
		Parent = ProgressBar,
		PaddingLeft = UDim.new(0, 10),
	})

	Creator:New("UICorner", {
		Parent = ProgressBar,
		CornerRadius = UDim.new(1, 0),
	})

	local Dot = Creator:New("Frame", {
		Name = "Dot",
		Parent = ProgressBar,
		Active = true,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 10, 0, 10),
	})

	Creator:New("UICorner", {
		Parent = Dot,
		CornerRadius = UDim.new(1, 0),
	})

	local Value = Creator:New("TextLabel", {
		Name = "Value",
		Parent = SliderHolder,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.744623661, 0, 0.428571433, 0),
		Font = Enum.Font.GothamMedium,
		Text = "",
		TextColor3 = Color3.fromRGB(180, 180, 180),
		TextSize = 16,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextYAlignment = Enum.TextYAlignment.Top,
		AutomaticSize = Enum.AutomaticSize.XY,
	})

	Creator:New("UICorner", {
		Parent = Slider,
		CornerRadius = UDim.new(0, 20),
	})

	Creator:New("UIPadding", {
		Parent = Slider,
		PaddingBottom = UDim.new(0, 15),
		PaddingLeft = UDim.new(0, 15),
		PaddingRight = UDim.new(0, 15),
		PaddingTop = UDim.new(0, 15),
	})

	Creator:New("UIListLayout", {
		Parent = Slider,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIStroke", {
		Parent = Slider,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Transparency = 0.9,
		Color = Color3.fromRGB(255, 255, 255),
	})

	SliderBar.AutoButtonColor = false

	local Callback = Data.Callback
	local MinValue = Data.Min or 0
	local MaxValue = Data.Max
	local Step = Data.Step
	local Default = Data.Default or MinValue

	local CurrentValue = Default or MinValue
	local IsDragging = false

	local ValueChanged = Signal:NewBind("SliderValueChanged") :: BindableEvent

	if Default ~= nil then
		local PercentValue = (Default - MinValue) / (MaxValue - MinValue)
		ProgressBar.Size = UDim2.new(PercentValue, 0, 1, 0)
		Value.Text = tostring(Default)

		Signal:SafeCallback(Callback, CurrentValue, Data.Title)
		ValueChanged:Fire(CurrentValue)
	end

	Signal:NewSignal(SliderBar, "MouseButton1Down", function()
		IsDragging = true
	end)

	Signal:NewSignal(Library.Services.UserInputService, "InputEnded", function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			IsDragging = false
		end
	end)

	Signal:NewSignal(Library.Services.RunService, "Heartbeat", function(Input)
		if IsDragging then
			local MouseX = Library.Services.UserInputService:GetMouseLocation().X
			local AbsolutePosition = SliderBar.AbsolutePosition.X
			local AbsoluteSize = SliderBar.AbsoluteSize.X
			local PercentValue = math.clamp((MouseX - AbsolutePosition) / AbsoluteSize, 0, 1)

			CurrentValue = math.floor(((MinValue + ((MaxValue - MinValue) * PercentValue)) / Step) + 0.5) * Step

			local Precision = math.max(0, math.floor(math.log10(1 / Step) + 0.5))
			Value.Text = string.format("%." .. tostring(Precision) .. "f", CurrentValue)

			Animator:Animate(
				ProgressBar,
				TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ Size = UDim2.new(PercentValue, 0, 1, 0) }
			)

			Signal:SafeCallback(Callback, CurrentValue, Data.Title)
			ValueChanged:Fire(CurrentValue)
		end
	end)

	return {
		SetDescription = function(self, Text)
			Description.Text = Text
		end,

		SetTitle = function(self, Text)
			Display.Text = Text
		end,

		SetValue = function(self, NewValue)
			local Clamped = math.clamp(NewValue, MinValue, MaxValue)
			CurrentValue = math.floor((Clamped / Step) + 0.5) * Step

			local PercentValue = (CurrentValue - MinValue) / (MaxValue - MinValue)

			local Precision = math.max(0, math.floor(math.log10(1 / Step) + 0.5))
			Value.Text = string.format("%." .. tostring(Precision) .. "f", CurrentValue)

			Animator:Animate(
				ProgressBar,
				TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{ Size = UDim2.new(PercentValue, 0, 1, 0) }
			)

			ValueChanged:Fire(CurrentValue)
			Signal:SafeCallback(Callback, CurrentValue, Data.Title)
		end,

		Binds = {
			OnValueChange = function(self, Func)
				assert(Func, "no function passed for 'OnValueChanged'")

				Signal:NewSignal(ValueChanged, "Event", function()
					Signal:SafeCallback(Func, CurrentValue, Data.Title)
				end)
			end,
		},
	}
end

return Slider

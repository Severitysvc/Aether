local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.New(Library, Body)
	local Self = setmetatable({}, Dropdown)

	Self.Library = Library
	Self.Body = Body

	return Self
end

function Dropdown:Init(Data)
	local Library = self.Library
	assert(Library, "No library found for '" .. (Data.Title or "Slider") .. ", ended thread")

	local Signal = Library.Signal
	local Creator = Library.Creator
	local Animator = Library.Animator

	local Dropdown = Creator:New("Frame", {
		Name = Data.Title,
		Parent = self.Body,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BackgroundTransparency = 0.4,
		BorderSizePixel = 0,
		Position = UDim2.new(0.023151705, 0, 0.290023208, 0),
		Size = UDim2.new(0.93, 0, 0, 0),
	})

	local Displays_1 = Creator:New("Frame", {
		Name = "Displays",
		Parent = Dropdown,
		AnchorPoint = Vector2.new(0, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0125523014, -6, 0.5, 0),
		Size = UDim2.new(0.763, 0, 0, 0),
	})

	local IconHolder_1 = Creator:New("Frame", {
		Name = "IconHolder",
		Parent = Displays_1,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(25, 25, 25),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 50, 0, 50),
		Visible = false,
	})

	local Icon = Library:GetIcon(Data.Icon) or ""

	local Icon_1 = Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = IconHolder_1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 27, 0, 27),
		Image = Icon.Image,
		ImageTransparency = 0.3,
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
		Position = UDim2.new(0.178094149, -6, 0, 0),
		Size = UDim2.new(0.279671192, 0, 1, 0),
	})

	Creator:New("UIListLayout", {
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
		Text = Data.Title,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = 18,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	Signal:HandleNil(Display_1)

	local Description_1 = Creator:New("TextLabel", {
		Name = "Description",
		Parent = Text_1,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Font = Enum.Font.GothamMedium,
		Text = Data.Description,
		TextColor3 = Color3.fromRGB(180, 180, 180),
		TextSize = 16,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
	})

	Signal:HandleNil(Description_1)

	Creator:New("UIListLayout", {
		Parent = Displays_1,
		Padding = UDim.new(0, 10),
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	local DropdownHolder_1 = Creator:New("TextButton", {
		Name = "DropdownHolder",
		Parent = Dropdown,
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Position = UDim2.new(0.298598409, 0, 0, 0),
		Size = UDim2.new(0, 254, 0, 54),
		Text = "",
	})

	Creator:New("UIListLayout", {
		Parent = DropdownHolder_1,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	local Dropdown_1 = Creator:New("Frame", {
		Name = "Dropdown",
		Parent = DropdownHolder_1,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(70, 70, 70),
		BackgroundTransparency = 0.6,
		Position = UDim2.new(0.00302494015, 0, 0.129629627, 0),
		Size = UDim2.new(0, 0, 0, 40),
	})

	local Title_1 = Creator:New("TextLabel", {
		Name = "Title",
		Parent = Dropdown_1,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1.01,
		LayoutOrder = 1,
		Size = UDim2.new(0, 0, 1, 0),
		Font = Enum.Font.GothamMedium,
		Text = "None...",
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = 15,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Right,
	})

	Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = Dropdown_1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 20, 0, 20),
		Image = "rbxassetid://10709797508",
		ImageTransparency = 0.3,
	})

	Creator:New("UIListLayout", {
		Parent = Dropdown_1,
		Padding = UDim.new(0, 7),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = Dropdown_1,
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 12),
	})

	Creator:New("UIStroke", {
		Parent = Dropdown_1,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.9,
	})

	Creator:New("UICorner", {
		Parent = Dropdown_1,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UISizeConstraint", {
		Parent = Dropdown_1,
		MaxSize = Vector2.new(173, math.huge),
	})

	Creator:New("UIStroke", {
		Parent = Dropdown,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.9,
	})

	Creator:New("UICorner", {
		Parent = Dropdown,
		CornerRadius = UDim.new(0, 20),
	})

	Creator:New("UIPadding", {
		Parent = Dropdown,
		PaddingBottom = UDim.new(0, 15),
		PaddingLeft = UDim.new(0, 15),
		PaddingRight = UDim.new(0, 15),
		PaddingTop = UDim.new(0, 15),
	})

	Creator:New("UIListLayout", {
		Parent = Dropdown,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
	})
	--// Setup
	local Callback = Data.Callback
	local Value = Data.Value
	local AllowNone = Data.AllowNone
	local Values = Data.Values or {}
	local Selected = {}

	local Multi = Data.Multi and Data.Multi.Enabled
	local Shadow = Data.Multi and Data.Multi.ShadowSelected

	local ValueChanged = Signal:NewBind("DropdownValueChanged")

	local NewSignal = nil
	local ActiveList = nil

	if Value then
		if Multi then
			assert(type(Value) == "table", "When using multi, make sure the value is also a table")

			for _, Item in pairs(Value) do
				if table.find(Values, Item) then
					table.insert(Selected, Item)
				end
			end
		else
			if table.find(Values, Value) then
				table.insert(Selected, Value)
			end
		end
	end

	local function HandleTitle()
		if #Selected == 0 then
			Title_1.Text = "None..."
		elseif Multi then
			if Shadow then
				Title_1.Text = "Selected " .. tostring(#Selected) .. " Items"
			else
				Title_1.Text = table.concat(Selected, ", ")
			end
		else
			Title_1.Text = Selected[1] or "None..."
		end
	end

	HandleTitle()
	Signal:SafeCallback(Callback, Selected, Data.Title)
	ValueChanged:Fire(Selected)

	local function HandleList(List)
		Values = Data.Values
		if Library.DropdownUI:FindFirstChild("ValueList") then
			Library.DropdownUI.ValueList:Destroy()
		end

		local MousePos = Library.Services.UserInputService:GetMouseLocation()

		local ValueList = Creator:New("ImageButton", {
			Name = "ValueList",
			Parent = Library.DropdownUI,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0, MousePos.X, 0, MousePos.Y),
			AutoButtonColor = false,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			BackgroundTransparency = 0.1,
			BorderSizePixel = 0,
			Modal = true,
			Size = UDim2.new(0, 196, 0, 0),
			ClipsDescendants = true,
			Image = "rbxassetid://16255699706",
			ImageTransparency = 0.95,
			ScaleType = Enum.ScaleType.Crop,
			ZIndex = 2,
		})
		Creator:New("UIStroke", {
			Parent = ValueList,
			Color = Color3.fromRGB(255, 255, 255),
			Thickness = 1,
			Transparency = 0.9,
		})
		Creator:New("UISizeConstraint", {
			Parent = ValueList,
			MaxSize = Vector2.new(math.huge, 335),
		})
		Creator:New("UICorner", {
			Parent = ValueList,
			CornerRadius = UDim.new(0, 20),
		})

		local ValueHolder_1 = Creator:New("ScrollingFrame", {
			Name = "ValueHolder",
			Parent = ValueList,
			Active = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			CanvasSize = UDim2.fromOffset(0, 0),
			ClipsDescendants = true,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 0,
			ZIndex = 3,
		})

		Creator:New("UIListLayout", {
			Parent = ValueHolder_1,
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		Creator:New("UISizeConstraint", {
			Parent = ValueList,
			MaxSize = Vector2.new(math.huge, 335),
		})

		if ValueHolder_1.AbsoluteSize.Y >= 335 then
			ValueHolder_1.AutomaticSize = Enum.AutomaticSize.None
			ValueHolder_1.Size = UDim2.new(1, 0, 0, 335)
		else
			ValueHolder_1.AutomaticSize = Enum.AutomaticSize.Y
			ValueHolder_1.Size = UDim2.new(1, 0, 0, 0)
		end

		ValueHolder_1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if ValueHolder_1.AbsoluteSize.Y >= 335 then
				ValueHolder_1.AutomaticSize = Enum.AutomaticSize.None
				ValueHolder_1.Size = UDim2.new(1, 0, 0, 335)
			else
				ValueHolder_1.AutomaticSize = Enum.AutomaticSize.Y
				ValueHolder_1.Size = UDim2.new(1, 0, 0, 0)
			end
		end)

		for _, Index in pairs(List) do
			local ValueItem = Creator:New("TextButton", {
				Name = tostring(Index),
				Parent = ValueHolder_1,
				BackgroundTransparency = 0.95,
				Size = UDim2.new(1, 0, 0, 0),
				Text = "",
				ZIndex = 4,
			})

			local ValueName_1 = Creator:New("TextLabel", {
				Name = "ValueName",
				Parent = ValueItem,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Font = Enum.Font.GothamMedium,
				Text = tostring(Index),
				TextColor3 = Color3.fromRGB(220, 220, 220),
				TextTransparency = 1,
				TextSize = 15,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 5,
			})

			Creator:New("UIListLayout", {
				Parent = ValueItem,
			})

			Creator:New("UIPadding", {
				Parent = ValueItem,
				PaddingLeft = UDim.new(0, 15),
			})

			Creator:New("UICorner", {
				Parent = ValueItem,
				CornerRadius = UDim.new(0, 20),
			})

			Animator:Animate(ValueItem, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(1, 0, 0, 40),
				BackgroundTransparency = 1,
			})
			Animator:Animate(ValueName_1, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				TextTransparency = 0,
			})

			Signal:NewSignal(ValueItem, "MouseButton1Click", function()
				if Multi then
					local FoundItem = table.find(Selected, ValueItem.Name)
					if FoundItem then
						table.remove(Selected, FoundItem)
					else
						table.insert(Selected, ValueItem.Name)
					end
				else
					Selected = { ValueItem.Name }
				end

				HandleTitle()
				Signal:SafeCallback(Callback, Selected, Data.Title)
				ValueChanged:Fire(Selected)
			end)

			Signal:NewSignal(ValueItem, "MouseEnter", function()
				Animator:Animate(ValueItem, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 0.9,
				})
			end)

			Signal:NewSignal(ValueItem, "MouseLeave", function()
				Animator:Animate(ValueItem, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					BackgroundTransparency = 1,
				})
			end)
		end

		task.delay(0.3, function()
			NewSignal = Signal:NewSignal(Library.Services.UserInputService, "InputEnded", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and ActiveList then
					ActiveList:Close()

					if NewSignal then
						NewSignal:Disconnect()
						NewSignal = nil
					end
				end
			end)
		end)

		return {
			Close = function()
				ActiveList = nil
				if ValueList:FindFirstChild("ValueHolder") then
					for _, Item in pairs(ValueHolder_1:GetChildren()) do
						if #ValueHolder_1:GetChildren() <= 8 then
							if Item:IsA("TextButton") then
								Animator:Animate(
									Item,
									TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
									{
										Size = UDim2.new(1, 0, 0, 0),
										BackgroundTransparency = 1,
									}
								)
								Animator:Animate(
									Item.ValueName,
									TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
									{
										TextTransparency = 1,
									}
								)
							end
						else
							ValueList.Visible = false
						end
					end

					task.wait(0.2)
					ValueList:Destroy()
				end
			end,
		}
	end

	Signal:NewSignal(DropdownHolder_1, "MouseButton1Click", function()
		ActiveList = HandleList(Values)
	end)

	return {
		Callback,
		Selected,
		AllowNone,
		Values,
		Multi,
		Shadow,

		SetDescription = function(_, Text)
			Description_1.Text = Text
		end,

		SetTitle = function(_, Text)
			Display_1.Text = Text
		end,

		OnValueChanged = function(_, Func)
			assert(Func, "no function passed for 'OnValueChanged'")

			ValueChanged.Event:Connect(function(Value)
				Signal:SafeCallback(Func, Value, Data.Title)
			end)
		end,
	}
end

return Dropdown

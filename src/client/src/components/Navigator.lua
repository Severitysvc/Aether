local Navigator = {}
Navigator.__index = Navigator

function Navigator.New(Library)
	local Self = setmetatable({}, Navigator)

	Self.Library = Library

	return Self
end

function Navigator:Init(NewData)
	local Methods = {}
	local Library = self.Library

	assert(Library, "no library found for 'Init' at Navigator.lua")

	local Creator = Library.Creator
	local Animator = Library.Animator
	local Signal = Library.Signal

	local Players = Library.Services.Players :: Players

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

	Creator:New("UIListLayout", {
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

	local Map = {
		["Center"] = Center_1,
		["Left"] = Left_1,
		["Right"] = Right_1,
	}

	local Bar_1 = Creator:New("ImageButton", {
		Name = "Bar",
		Parent = Map[NewData.BarSection] or Center_1,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = 0.10000000149011612,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Modal = true,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 55),
		Image = Library.BackgroundImage,
		ImageTransparency = 0.8999999761581421,
		ScaleType = Enum.ScaleType.Crop,
	})

	Creator:New("UIStroke", {
		Parent = Bar_1,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.9,
	})

	Creator:New("UICorner", {
		Parent = Bar_1,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UIListLayout", {
		Parent = Bar_1,
		Padding = UDim.new(0, 5),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = Bar_1,
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
	})

	Creator:New("UIPadding", {
		Parent = Center_1,
		PaddingBottom = UDim.new(0.15, 0),
		PaddingLeft = UDim.new(0, 15),
	})

	Creator:New("UIListLayout", {
		Parent = Right_1,
		Padding = UDim.new(0, 5),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
	})

	Creator:New("UIPadding", {
		Parent = Right_1,
		PaddingRight = UDim.new(0, 15),
	})

	if Library.Mobile == true then
		UIPadding_1.PaddingBottom = UDim.new(0, 10)
	end

	if NewData.Profile.Enabled then
		local ProfileBar = Creator:New("ImageButton", {
			Name = "Profile Bar",
			Parent = Bar_1.Parent,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
			BackgroundTransparency = 0.1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Modal = true,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 0, 0, 55),
			Image = "rbxassetid://16255699706",
			ImageTransparency = 0.9,
			ScaleType = Enum.ScaleType.Crop,
		})

		local Screenshot_1 = Creator:New("ImageButton", {
			Name = "Screenshot",
			Parent = ProfileBar,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(70, 70, 70),
			BackgroundTransparency = 0.1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Modal = true,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 45, 0, 45),
			Image = "rbxassetid://16255699706",
			ImageTransparency = 0.95,
			ScaleType = Enum.ScaleType.Crop,
		})

		Creator:New("UICorner", {
			Parent = Screenshot_1,
			CornerRadius = UDim.new(1, 0),
		})

		Creator:New("UIStroke", {
			Parent = Screenshot_1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(255, 255, 255),
			Thickness = 1,
		})

		local ThumbnailImage = Creator:New("ImageLabel", {
			Name = "Screenshot",
			Parent = Screenshot_1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			Image = Players:GetUserThumbnailAsync(
				Players.LocalPlayer.UserId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size48x48
			),
		})

		if NewData.Profile.HideThumbnail then
			ThumbnailImage.Image =
				Players:GetUserThumbnailAsync(1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
		else
			ThumbnailImage.Image = Players:GetUserThumbnailAsync(
				Players.LocalPlayer.UserId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size48x48
			)
		end

		Creator:New("UICorner", {
			Parent = ThumbnailImage,
			CornerRadius = UDim.new(1, 0),
		})

		local Identifier_1 = Creator:New("ImageButton", {
			Name = "Identifier",
			Parent = Screenshot_1,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
			BackgroundTransparency = 0.1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Modal = true,
			Position = UDim2.new(0.5, 0, -0.877777755, 0),
			Size = UDim2.new(0, 45, 0, 45),
			Visible = false,
			Image = "rbxassetid://16255699706",
			ImageTransparency = 0.95,
			ScaleType = Enum.ScaleType.Crop,
		})

		Creator:New("UICorner", {
			Parent = Identifier_1,
			CornerRadius = UDim.new(1, 0),
		})

		local DisplayName = Creator:New("TextLabel", {
			Name = "Title",
			Parent = Identifier_1,
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.01,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 1, 0),
			Font = Enum.Font.GothamMedium,
			Text = "",
			TextColor3 = Color3.fromRGB(220, 220, 220),
			TextSize = 15,
		})

		if NewData.Profile.HideName then
			DisplayName.Text = "Anonymous"
		else
			DisplayName.Text = Players.LocalPlayer.DisplayName
		end

		Creator:New("UIListLayout", {
			Parent = Identifier_1,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		})

		Creator:New("UIPadding", {
			Parent = Identifier_1,
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		})

		Creator:New("UICorner", {
			Parent = ProfileBar,
			CornerRadius = UDim.new(1, 0),
		})

		Creator:New("UIListLayout", {
			Parent = ProfileBar,
			Padding = UDim.new(0, 5),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		})

		Creator:New("UIPadding", {
			Parent = ProfileBar,
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
		})
	end

	local Selected
	function Methods:CreateTab(Data)
		local New = {}
		local Window = Library.Window

		assert(Window, "no window module found for 'Init' at Navigator.lua")
		local Context = Window:WindowContext({
			SearchBarEnabled = Data.SearchBarEnabled,
			Title = Data.Title or Data.Name or "ScrollingFrame",
		})

		local Tab_1 = Creator:New("ImageButton", {
			Name = Data.Title or Data.Name or "",
			Parent = Bar_1,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(70, 70, 70),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Modal = true,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 0, 0, 45),
			Image = Library.BackgroundImage,
			ImageTransparency = 0.95,
			ScaleType = Enum.ScaleType.Crop,
		})

		local TabPad = Creator:New("UIPadding", {
			PaddingRight = UDim.new(0, 9),
			PaddingLeft = UDim.new(0, 9),
			Parent = Tab_1,
		})

		Creator:New("UICorner", {
			Parent = Tab_1,
			CornerRadius = UDim.new(1, 0),
		})

		Creator:New("UIListLayout", {
			Parent = Tab_1,
			Padding = UDim.new(0, 8),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		})

		Creator:New("UIStroke", {
			Parent = Tab_1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(255, 255, 255),
			Thickness = 1,
			Transparency = 1,
		})

		local Icon = Library:GetIcon(Data.Icon) or ""

		local Icon_2 = Creator:New("ImageLabel", {
			Name = "Icon",
			Parent = Tab_1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 27, 0, 27),
			Image = Icon.Image,
			ImageTransparency = 0.3,
			ImageRectOffset = Icon.ImageRectPosition,
			ImageRectSize = Icon.ImageRectSize,
		})

		Signal:HandleNil(Icon_2)

		local Title = Creator:New("TextLabel", {
			Name = "Title",
			Parent = Tab_1,
			AutomaticSize = Enum.AutomaticSize.None,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 1, 0),
			Font = Enum.Font.GothamMedium,
			Text = Data.Title or Data.Name or "",
			LayoutOrder = 1,
			TextColor3 = Color3.fromRGB(220, 220, 220),
			TextSize = 15,
			TextTransparency = 0,
			ClipsDescendants = true,
		}) :: TextLabel

		local function HandleSelection(Bool, Tab)
			assert(Tab, "Tab is nil for 'HandleSelection'")

			if Bool then
				Tab:SetAttribute("Selected", true)
				Selected = Tab

				Animator:Animate(
					Tab,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ BackgroundTransparency = 0.1 }
				)
				Animator:Animate(
					Tab:FindFirstChild("UIStroke"),
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Transparency = 0.75 }
				)

				Animator:Animate(Title, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, Title.TextBounds.X, 1, 0),
					TextColor3 = Color3.fromRGB(255, 255, 255),
				})

				shared.ActiveTab = Tab
			else
				Tab:SetAttribute("Selected", false)

				Animator:Animate(
					Tab,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ BackgroundTransparency = 1 }
				)
				Animator:Animate(
					Tab:FindFirstChild("UIStroke"),
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Transparency = 1 }
				)

				Animator:Animate(Title, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, 0, 1, 0),
					TextColor3 = Color3.fromRGB(255, 255, 255),
				})
			end
		end

		Tab_1:SetAttribute("Selected", false)

		Signal:NewSignal(Tab_1, "MouseButton1Click", function()
			if Selected and Selected ~= Tab_1 then
				Window:Enter()
				HandleSelection(false, Selected)
				HandleSelection(true, Tab_1)

				Window:Change(Tab_1.Name or Data.Name or Data.Title or nil)
			elseif not Selected then
				HandleSelection(true, Tab_1)

				Window:Change(Tab_1.Name or Data.Name or Data.Title or nil)
				Window:Enter()
			else
				HandleSelection(false, Tab_1)
				Selected = nil

				Window:Exit()
			end
		end)

		--// Anims
		Signal:NewSignal(Tab_1, "MouseEnter", function()
			if not Tab_1:GetAttribute("Selected") then
				Animator:Animate(
					Tab_1,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ BackgroundTransparency = 0.8 }
				)
				Animator:Animate(
					Tab_1:FindFirstChild("UIStroke"),
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Transparency = 0.88 }
				)
			end

			Animator:Animate(Title, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, Title.TextBounds.X, 1, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
			})
		end)

		Signal:NewSignal(Tab_1, "MouseLeave", function()
			if not Tab_1:GetAttribute("Selected") then
				Animator:Animate(
					Tab_1,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ BackgroundTransparency = 1 }
				)
				Animator:Animate(
					Tab_1:FindFirstChild("UIStroke"),
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Transparency = 1 }
				)

				Animator:Animate(Title, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Size = UDim2.new(0, 0, 1, 0),
					TextColor3 = Color3.fromRGB(255, 255, 255),
				})
			end
		end)

		--// Methods
		function New:ChangeTitle(TextContent)
			assert(TextContent, "No text for 'ChangeTitle'")
			Title.Text = tostring(TextContent)
		end

		function New:ChangeIcon(Icon)
			if type(Icon) == "string" and Icon:find("rbxassetid") then
				Icon_2.Image = Icon
				Icon_2.ImageRectOffset = Vector2.new(0, 0)
				Icon_2.ImageRectSize = Vector2.new(0, 0)
			else
				local Icon = Library:GetIcon(Icon)

				Icon_2.Image = Icon.Image
				Icon_2.ImageTransparency = 0.3
				Icon_2.ImageRectOffset = Icon.ImageRectPosition
				Icon_2.ImageRectSize = Icon.ImageRectSize
			end
		end

		function New:CreateToggle(Data)
			local Toggle = Context:NewToggle({
				Title = Data.Title or Data.Name or "Toggle",
				Icon = Data.Icon or "",
				Description = Data.Description or Data.Desc or "",
				Default = Data.Default or Data.DefaultValue or false,
				Callback = Data.Callback or nil,
			})

			return Toggle
		end

		function New:CreateSlider(Data)
			local Slider = Context:NewSlider({
				Title = Data.Title or Data.Name or "Toggle",
				Icon = Data.Icon or "",
				Description = Data.Description or Data.Desc or "",
				Default = Data.Default
					or Data.DefaultValue
					or Data.Values and Data.Values.Default
					or Data.Values and Data.Values.DefaultValue
					or 0,
				Min = Data.Min
					or Data.MinValue
					or Data.Values and Data.Values.Min
					or Data.Values and Data.Values.MinValue
					or 0,
				Max = Data.Max
					or Data.MaxValue
					or Data.Values and Data.Values.Max
					or Data.Values and Data.Values.MaxValue
					or 1,
				Step = Data.Step
					or Data.StepValue
					or Data.Values and Data.Values.Step
					or Data.Values and Data.Values.StepValue
					or 1,
				Callback = Data.Callback or nil,
			})

			return Slider
		end

		function New:CreateDropdown(Data)
			local Dropdown = Context:NewDropdown({
				Title = Data.Title or Data.Name or "Dropdown",
				Icon = Data.Icon or "",
				Description = Data.Description or Data.Desc or "",
				Value = Data.Selected or Data.Default,
				Values = Data.Values,
				Multi = Data.Multi or false,
				AllowNone = Data.AllowNone or false,
				Callback = Data.Callback,
			})

			return Dropdown
		end

		function New:CreateSection(Data)
			local Section = Context:NewSection({
				Title = Data.Title or Data.Name or "Dropdown",
				Icon = Data.Icon or "",
				Alignment = "Left",
				TextSize = 17,
			})

			return Section
		end

		function New:CreateButton(Data)
			local Button = Context:NewButton()

			return Button
		end

		function New:Select()
			HandleSelection(true, Tab_1)
		end

		function New:UnSelect()
			HandleSelection(false, Tab_1)
		end

		return New
	end

	function Methods:CreateDivider()
		local Dividier = Creator:New("Frame", {
			Size = UDim2.new(0, 1, 0.5, 0, 0),
			Transparency = 0.9,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Parent = Bar_1,
		})

		return Dividier
	end

	function Methods:SetBarSection(Direciton)
		Bar_1.Parent = Map[Direciton] or Center_1
	end

	return Methods
end

return Navigator

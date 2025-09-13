local Window = {}
Window.__index = Window

function Window.New(Library)
	local Self = setmetatable({}, Window)

	Self.Library = Library
	Self.DefaultSize = UDim2.new(0, 425, 0, 520)

	return Self
end

function Window:Init(NewData)
	local New = {}

	local Library = self.Library

	assert(Library, "no library found for 'Init' at Window.lua")

	local Creator = Library.Creator
	local Animator = Library.Animator
	local Signal = Library.Signal

	local Elements = Library.Elements

	local WindowInstance = Creator:New("ImageButton", {
		Name = "Window",
		Parent = Library.AetherUI,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = 0.1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Modal = true,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = NewData.WindowSize or self.DefaultSize,
		ClipsDescendants = true,
		Image = Library.BackgroundImage,
		ImageTransparency = 0.9,
		ScaleType = Enum.ScaleType.Crop,
	})

	local Size = WindowInstance.Size

	Creator:New("UICorner", {
		Parent = WindowInstance,
		CornerRadius = UDim.new(0, 25),
	})

	Creator:New("UIStroke", {
		Parent = WindowInstance,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.9,
	})

	local TopBar_1 = Creator:New("Frame", {
		Name = "TopBar",
		Parent = WindowInstance,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = -1,
		Size = UDim2.new(1, 0, 0, 71),
	})

	local Header_1 = Creator:New("Frame", {
		Name = "Header",
		Parent = TopBar_1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(0.5, 0, 1, 0),
	})

	local Title_1 = Creator:New("ImageButton", {
		Name = "Title",
		Parent = Header_1,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(15, 15, 15),
		BackgroundTransparency = 0.1,
		BorderSizePixel = 0,
		Modal = true,
		Position = UDim2.new(0.22639218, 0, 0.447589278, 0),
		Size = UDim2.new(0, 45, 0, 45),
		Image = Library.BackgroundImage,
		ImageTransparency = 0.95,
		ScaleType = Enum.ScaleType.Crop,
	})

	Creator:New("UICorner", {
		Parent = Title_1,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UIListLayout", {
		Parent = Title_1,
		Padding = UDim.new(0, 7),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = Title_1,
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 12),
	})

	Creator:New("UIStroke", {
		Parent = Title_1,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.9,
	})

	local Title_2 = Creator:New("TextLabel", {
		Name = "Title",
		Parent = Title_1,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = UDim2.new(0, 0, 1, 0),
		Font = Enum.Font.GothamMedium,
		Text = NewData.Title,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = 15,
	})

	local Logo = Library:GetIcon(NewData.Logo or NewData.Icon or "") or ""

	local Icon_1 = Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = Title_1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 22, 0, 22),
		Image = Logo.Image,
		ImageTransparency = 0.3,
		ImageRectSize = Logo.ImageRectSize,
		ImageRectOffset = Logo.ImageRectPosition,
	})

	Signal:HandleNil(Icon_1)

	Creator:New("UIListLayout", {
		Parent = Header_1,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = Header_1,
		PaddingLeft = UDim.new(0, 10),
	})

	Creator:New("UIListLayout", {
		Parent = TopBar_1,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
	})

	local ButtonZones_1 = Creator:New("Frame", {
		Name = "Button Zones",
		Parent = TopBar_1,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.643529415, 0, 0, 0),
		Size = UDim2.new(0.356470585, 0, 1, 0),
	})

	local NotificationButton = Creator:New("ImageButton", {
		Name = "Button",
		Parent = ButtonZones_1,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BackgroundTransparency = 0.1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Modal = true,
		Position = UDim2.new(0.22639218, 0, 0.447589278, 0),
		Size = UDim2.new(0, 35, 0, 35),
		Image = Library.BackgroundImage,
		ImageTransparency = 0.95,
		ScaleType = Enum.ScaleType.Crop,
	})

	Creator:New("UICorner", {
		Parent = NotificationButton,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UIListLayout", {
		Parent = NotificationButton,
		Padding = UDim.new(0, 7),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = NotificationButton,
		PaddingLeft = UDim.new(0, 7),
		PaddingRight = UDim.new(0, 7),
	})

	Creator:New("UIStroke", {
		Parent = NotificationButton,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
	})

	Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = NotificationButton,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 22, 0, 22),
		Image = "rbxassetid://10709775241",
		ImageTransparency = 0.3,
	})

	local MinimizeButton = Creator:New("ImageButton", {
		Name = "Button",
		Parent = ButtonZones_1,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BackgroundTransparency = 0.1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Modal = true,
		Position = UDim2.new(0.22639218, 0, 0.447589278, 0),
		Size = UDim2.new(0, 35, 0, 35),
		Image = Library.BackgroundImage,
		ImageTransparency = 0.95,
		ScaleType = Enum.ScaleType.Crop,
	})

	Creator:New("UICorner", {
		Parent = MinimizeButton,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UIListLayout", {
		Parent = MinimizeButton,
		Padding = UDim.new(0, 7),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = MinimizeButton,
		PaddingLeft = UDim.new(0, 7),
		PaddingRight = UDim.new(0, 7),
	})

	Creator:New("UIStroke", {
		Parent = MinimizeButton,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
	})

	Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = MinimizeButton,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 22, 0, 22),
		Image = "rbxassetid://10734896206",
		ImageTransparency = 0.3,
	})

	local CloseButton = Creator:New("ImageButton", {
		Name = "Button",
		Parent = ButtonZones_1,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutoButtonColor = false,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BackgroundTransparency = 0.1,
		Modal = true,
		Position = UDim2.new(0.22639218, 0, 0.447589278, 0),
		Size = UDim2.new(0, 35, 0, 35),
		Image = Library.BackgroundImage,
		ImageTransparency = 0.95,
		ScaleType = Enum.ScaleType.Crop,
	})

	Creator:New("UICorner", {
		Parent = CloseButton,
		CornerRadius = UDim.new(1, 0),
	})

	Creator:New("UIListLayout", {
		Parent = CloseButton,
		Padding = UDim.new(0, 7),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	Creator:New("UIPadding", {
		Parent = CloseButton,
		PaddingLeft = UDim.new(0, 7),
		PaddingRight = UDim.new(0, 7),
	})

	Creator:New("UIStroke", {
		Parent = CloseButton,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
	})

	Creator:New("ImageLabel", {
		Name = "Icon",
		Parent = CloseButton,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 22, 0, 22),
		Image = "rbxassetid://10747384394",
		ImageTransparency = 0.3,
	})

	Creator:New("UIPadding", {
		Parent = ButtonZones_1,
		PaddingRight = UDim.new(0, 15),
	})

	Creator:New("UIListLayout", {
		Parent = ButtonZones_1,
		Padding = UDim.new(0, 8),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
	})

	local Container_1 = Creator:New("ScrollingFrame", {
		Name = "Container",
		Parent = WindowInstance,
		Active = true,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0.148076922, 0),
		Size = UDim2.new(0.997647047, 0, 0.832692325, 0),
		ClipsDescendants = true,
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
		CanvasPosition = Vector2.new(0, 0),
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
		HorizontalScrollBarInset = Enum.ScrollBarInset.None,
		MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		ScrollBarImageTransparency = 0,
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.XY,
		TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
		VerticalScrollBarInset = Enum.ScrollBarInset.None,
		VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
		ScrollingEnabled = false,
	})

	Creator:New("UIListLayout", {
		Parent = Container_1,
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	Creator:New("UIListLayout", {
		Parent = WindowInstance,
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	for _, Stroke in pairs(ButtonZones_1:GetDescendants()) do
		if Stroke:IsA("UIStroke") then
			Stroke.Transparency = 0.85
		end
	end

	if NewData.TopBarBorder then
		local IgnoreLayout = Creator:New("Folder", {
			Parent = TopBar_1,
		})

		Creator:New("Frame", {
			Parent = IgnoreLayout,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.9,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
		})
	end

	do --// Button Anims
		for _, Button in pairs(ButtonZones_1:GetChildren()) do
			if Button:IsA("ImageButton") then
				Signal:NewSignal(Button, "MouseEnter", function()
					Animator:Animate(
						Button,
						TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{ BackgroundColor3 = Color3.fromRGB(70, 70, 70), Size = UDim2.new(0, 40, 0, 40) }
					)

					Animator:Animate(
						Button:FindFirstChild("UIStroke"),
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Transparency = 0.75 }
					)
				end)

				Signal:NewSignal(Button, "MouseLeave", function()
					Animator:Animate(
						Button,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ BackgroundColor3 = Color3.fromRGB(40, 40, 40), Size = UDim2.new(0, 35, 0, 35) }
					)

					Animator:Animate(
						Button:FindFirstChild("UIStroke"),
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ Transparency = 0.85 }
					)
				end)
			end
		end

		Signal:NewSignal(ButtonZones_1, "ChildAdded", function(Button)
			Signal:NewSignal(Button, "MouseEnter", function()
				Animator:Animate(
					Button,
					TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{ BackgroundColor3 = Color3.fromRGB(70, 70, 70), Size = UDim2.new(0, 40, 0, 40) }
				)

				Animator:Animate(
					Button:FindFirstChild("UIStroke"),
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Transparency = 0.75 }
				)
			end)

			Signal:NewSignal(Button, "MouseLeave", function()
				Animator:Animate(
					Button,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ BackgroundColor3 = Color3.fromRGB(40, 40, 40), Size = UDim2.new(0, 35, 0, 35) }
				)

				Animator:Animate(
					Button:FindFirstChild("UIStroke"),
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Transparency = 0.85 }
				)
			end)
		end)
	end

	function New:WindowContext(Data)
		local Elements = {}

		local ElemContainer = Creator:New("ScrollingFrame", {
			Name = Data.Title,
			Parent = Container_1,
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ClipsDescendants = true,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
			CanvasPosition = Vector2.new(0, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
			HorizontalScrollBarInset = Enum.ScrollBarInset.None,
			MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
			ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
			ScrollBarImageTransparency = 0,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.XY,
			TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
		})

		Creator:New("UIListLayout", {
			Parent = ElemContainer,
			Padding = UDim.new(0, 8),
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		Creator:New("TextLabel", {
			Name = "Display",
			Parent = ElemContainer,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0.363, 0),
			Size = UDim2.new(0.95, 0, 0, 17),
			FontFace = Library.Font.SemiBold,
			RichText = true,
			Text = "Section",
			TextColor3 = Color3.fromRGB(220, 220, 220),
			TextSize = 18,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		do --// Container Anims
			for _, Element in pairs(ElemContainer:GetChildren()) do
				if Element.Name == "SearchBar" then
					return
				end

				if Element:FindFirstChild("UICorner") then
					Signal:NewSignal(Element, "MouseEnter", function()
						Animator:Animate(
							Element:FindFirstChild("UICorner"),
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ CornerRadius = UDim.new(0, 15) }
						)
					end)

					Signal:NewSignal(Element, "MouseLeave", function()
						Animator:Animate(
							Element:FindFirstChild("UICorner"),
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{ CornerRadius = UDim.new(0, 20) }
						)
					end)
				end
			end

			Signal:NewSignal(ElemContainer, "ChildAdded", function(Element)
				Signal:NewSignal(Element, "MouseEnter", function()
					Animator:Animate(
						Element:FindFirstChild("UICorner"),
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ CornerRadius = UDim.new(0, 13) }
					)
				end)

				Signal:NewSignal(Element, "MouseLeave", function()
					Animator:Animate(
						Element:FindFirstChild("UICorner"),
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ CornerRadius = UDim.new(0, 20) }
					)
				end)
			end)
		end

		if Data.SearchBarEnabled then
			local FakeContainer
			local SearchBarContainer = Instance.new("Folder", Container_1)

			local SearchBar = Creator:New("ImageButton", {
				Name = "SearchBar",
				Parent = ElemContainer,
				Active = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutoButtonColor = false,
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundColor3 = Color3.fromRGB(15, 15, 15),
				BackgroundTransparency = 0.1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				LayoutOrder = -1,
				Modal = true,
				Position = UDim2.new(0.48815167, 0, 0.0359628759, 0),
				Size = UDim2.new(0.94, 0, 0, 45),
				Image = Library.BackgroundImage,
				ImageTransparency = 0.95,
				ScaleType = Enum.ScaleType.Crop,
			})

			Creator:New("UICorner", {
				Parent = SearchBar,
				CornerRadius = UDim.new(1, 0),
			})

			Creator:New("UIListLayout", {
				Parent = SearchBar,
				Padding = UDim.new(0, 7),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			})

			Creator:New("UIPadding", {
				Parent = SearchBar,
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
			})

			Creator:New("UIStroke", {
				Parent = SearchBar,
				Color = Color3.fromRGB(255, 255, 255),
				Thickness = 1,
				Transparency = 0.9,
			})

			local SearchBox = Creator:New("TextBox", {
				Name = "Title",
				Parent = SearchBar,
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(0, 0, 1, 0),
				PlaceholderText = "Search",
				PlaceholderColor3 = Color3.fromRGB(220, 220, 220),
				Font = Enum.Font.GothamMedium,
				Text = "",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 15,
			}) :: TextBox

			Creator:New("ImageLabel", {
				Name = "Icon",
				Parent = SearchBar,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 22, 0, 22),
				Image = "rbxassetid://10734943674",
				ImageTransparency = 0.3,
			})

			SearchBox:GetAttributeChangedSignal("Text"):Connect(function()
				local Text = SearchBox.Text:lower()

				if Text == "" then
					if FakeContainer then
						FakeContainer:Destroy()
						FakeContainer = nil
					end

					for _, Element in pairs(ElemContainer:GetChildren()) do
						if Element ~= SearchBar then
							Element.Visible = true
						end
					end
					return
				end

				if not FakeContainer then
					FakeContainer = ElemContainer:Clone()
					FakeContainer.Parent = SearchBarContainer
				end

				for _, Element in pairs(ElemContainer:GetChildren()) do
					if Element ~= SearchBar then
						Element.Visible = Element.Name:lower():find(Text) ~= nil
					end
				end
			end)
		end

		function Elements:NewToggle(Data)
			local Toggle = Elements.Toggle.New(Library, ElemContainer)
			local New = Toggle:Init(Data)

			return New
		end

		function Elements:NewSlider(Data)
			local Slider = Elements.Slider.New(Library, ElemContainer)
			local New = Slider:Init(Data)

			return New
		end

		function Elements:NewDropdown(Data)
			local Dropdown = Elements.Dropdown.New(Library, ElemContainer)
			local New = Dropdown:Init(Data)

			return New
		end

		function Elements:NewSection(Data)
			local Section = Elements.Section.New(Library, ElemContainer)
			local New = Section:Init(Data)

			return New
		end

		return Elements
	end

	function New:TopbarButton(Data)
		local NewButton = Creator:New("ImageButton", {
			Name = Data.Title or "button" .. tostring(#ButtonZones_1:GetChildren()),
			Parent = ButtonZones_1,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			BackgroundTransparency = 0.1,
			Modal = true,
			Position = UDim2.new(0.22639218, 0, 0.447589278, 0),
			Size = UDim2.new(0, 35, 0, 35),
			Image = Library.BackgroundImage,
			ImageTransparency = 0.95,
			ScaleType = Enum.ScaleType.Crop,
			LayoutOrder = Data.Order,
		})

		Creator:New("UICorner", {
			Parent = NewButton,
			CornerRadius = UDim.new(1, 0),
		})

		Creator:New("UIListLayout", {
			Parent = NewButton,
			Padding = UDim.new(0, 7),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		})

		Creator:New("UIPadding", {
			Parent = NewButton,
			PaddingLeft = UDim.new(0, 7),
			PaddingRight = UDim.new(0, 7),
		})

		Creator:New("UIStroke", {
			Parent = NewButton,
			Color = Color3.fromRGB(255, 255, 255),
			Thickness = 1,
		})

		Creator:New("ImageLabel", {
			Name = "Icon",
			Parent = NewButton,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 22, 0, 22),
			Image = Data.Icon,
			ImageTransparency = 0.3,
		})

		Signal:NewSignal(NewButton, "MouseButton1Click", function()
			Signal:SafeCallback(Data.Callback, nil, Data.Title)
		end)
	end

	function New:Enter()
		WindowInstance.Visible = true

		Animator:Animate(
			WindowInstance,
			TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
			{ Size = UDim2.new(0, Size.X.Offset, 0, Size.Y.Offset) }
		)
	end

	function New:Exit(Tab)
		if shared.ActiveTab then
			local Tab = shared.ActiveTab
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
		end

		Animator:Animate(
			WindowInstance,
			TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ Size = UDim2.fromOffset(WindowInstance.AbsoluteSize.X, 0) }
		)

		task.wait(0.35)
		WindowInstance.Visible = false
	end

	function New:Change(Hash)
		print(Hash)
		if type(Hash) == "string" then
			for Index, Container in pairs(Container_1:GetChildren()) do
				if Container.Name == Hash then
					Animator:Animate(
						Container_1,
						TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ CanvasPosition = Vector2.new(Container_1.AbsoluteSize.X * tonumber(Index - 2), 0) }
					)
					print(tostring(Container_1.AbsoluteSize.X * tonumber(Index - 2)))
				end
			end
		end
	end

	Signal:NewSignal(MinimizeButton, "MouseButton1Click", function()
		New:Exit()
	end)

	Signal:NewSignal(CloseButton, "MouseButton1Click", function()
		Library:Uninject()
	end)

	Signal:NewSignal(NotificationButton, "MouseButton1Click", function()
		Library.NotifyEnabled = not false --//TODO
	end)

	return New
end

return Window

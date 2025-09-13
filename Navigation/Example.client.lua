local Main = require(script.Parent.Main)

local Setup = Main:Init({
	Window = {
		Theme = "", --// Coming Soon;
		WindowSize = UDim2.fromOffset(500, 420),
		WindowTitle = "Aether Window Example",
		Resizable = "", --// Coming Soon
		Draggable = true,
	},

	Navigator = {
		Section = "Center", --// This defines where the navigator bar will be placed {other : "Left", "Right"}
		Profile = {
			Enabled = true,
			HideUser = true,
			HideThumbnail = true,
		},
	},
})

local Tab = Setup:CreateTab({
	Title = "Example title",
	Icon = "box",
	SearchBar = true,
	CreateTabSection = true, --// This creates a section above everything with the tab tittle
})

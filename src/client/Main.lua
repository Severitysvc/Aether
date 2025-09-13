local init = require("./src/Init")

local setup = init.New()
local mainsetup = setup:Init({
	Navigator = {
		BarSection = "Center",
		Profile = {
			Enabled = false,
			HideName = false,
			HideThumbnail = false,
		},
	},

	Window = {
		WindowSize = nil,
		Title = "Aether window example",
		Logo = "",
		TopBarBorder = true,
	},
})

local NewTab = mainsetup:CreateTab({
	Title = "Example tab2",
	Icon = "box",
	SearchBarEnabled = false,
})

mainsetup:CreateDivider()

mainsetup:CreateTab({
	Title = "Example tab1",
	Icon = "box",
	SearchBarEnabled = false,
})

local Toggle = NewTab:CreateToggle({
	Title = "Hello World",
	Icon = "tree",
	Desc = "This toggle is an example",
	Default = false,
	Callback = function(Bool)
		print(Bool)
	end,
})

local Dropdown = NewTab:CreateDropdown({
	Title = "Dropdown Example",
	Desc = "This is a dropdown example thx np",
	Values = { "Hello skid", "1", "s" },
	Selected = "Hello skid",
	Multi = false,
	AllowNone = true,
	Callback = function(Item)
		print(Item)
	end,
})

Toggle.Binds:OnValueChange(function(Bool)
	print("OnValueChange: ", Bool)
end)

local Slider = NewTab:CreateSlider({
	Title = "Slider Example",
	Icon = "tree",
	Desc = "This slider is an example",
	Default = false,
	Min = 0,
	Max = 100,
	Step = 1.5,
	Callback = function(Bool)
		print(Bool)
	end,
})

Slider.Binds:OnValueChange(function(Value)
	Slider:SetValue(Value + 1)
end)

init:Notify({
	Title = "Hellllo wp+orld2",
	Content = "Hello world iadaa  doadja0 diajdija 0iaoj",
	Duration = 10,
})

Toggle:SetValue(true)

return nil

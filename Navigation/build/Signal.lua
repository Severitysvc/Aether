local Handler = {}
Handler.__index = Handler
Handler.ActiveConnections = {}

function Handler:NewSignal(Instance, EventName, Callback)
	assert(Instance, "no passed Instance for 'NewSignal'")

	local Event = Instance[EventName]
	if typeof(Event) ~= "RBXScriptSignal" then
		error(EventName .. " is not a valid signal for " .. Instance.ClassName)
	end

	local Connection = Event:Connect(Callback)
	table.insert(self.ActiveConnections, Connection)
	return Connection
end

function Handler:NewClickSignal(Instanced, Callback)
	local Button = Instance.new("TextButton")
	Button.Parent = Instanced
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.BackgroundTransparency = 1
	Button.Text = ""

	self:NewSignal(Button, "MouseButton1Click", Callback)
end

function Handler:HandleNil(Instance, Hash)
	local HashInstance = Hash or Instance
	if Instance:IsA("TextLabel") then
		if Instance.Text == "" or Instance.Text == nil then
			HashInstance.Visible = false
		else
			HashInstance.Visible = true
		end

		Instance:GetPropertyChangedSignal("Text"):Connect(function()
			if Instance.Text == "" or Instance.Text == nil then
				HashInstance.Visible = false
			else
				HashInstance.Visible = true
			end
		end)
	elseif Instance:IsA("ImageLabel") or Instance:IsA("ImageButton") then
		if Instance.Image == "" or Instance.Image == nil then
			HashInstance.Visible = false
		else
			HashInstance.Visible = true
		end

		Instance:GetPropertyChangedSignal("Image"):Connect(function()
			if Instance.Image == "" or Instance.Image == nil then
				HashInstance.Visible = false
			else
				HashInstance.Visible = true
			end
		end)
	end
end

function Handler:NewBind(Name, Callback)
	local Bind = Instance.new("BindableEvent")
	Bind.Name = Name

	if Callback then
		Bind.Event:Connect(Callback)
	end

	return Bind
end

function Handler:HandleChange(Instance, Hash)
	Hash.Size = UDim2.new(Hash.Size.X.Scale, Hash.Size.X.Offset, Hash.Size.Y.Scale, Instance.AbsoluteSize.Y)

	Instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		Hash.Size = UDim2.new(Hash.Size.X.Scale, Hash.Size.X.Offset, Hash.Size.Y.Scale, Instance.AbsoluteSize.Y)
	end)
end

function Handler:SafeCallback(Callback, Value, ContextName)
	assert(Callback, "Callback is nil for 'SafeCallback'")
	--// assert(Value, "Value is nil for 'SafeCallback'")

	local Success, Error = pcall(function()
		Callback(Value)
	end)

	if not Success then
		warn("[Aether Debug, " .. (ContextName or "unnamed") .. "]: " .. tostring(Error))
	end
end

function Handler:GetElementPositionFromTable(Table, Element)
	for i, v in pairs(Table) do
		if v == Element then
			return i
		end
	end
	return nil
end

function Handler:DisconnectSignal(Connection)
	for i, Conn in ipairs(self.ActiveConnections) do
		if Conn == Connection then
			Conn:Disconnect()
			table.remove(self.ActiveConnections, i)
			break
		end
	end
end

function Handler:DisconnectAllSignals()
	for _, Conn in ipairs(self.ActiveConnections) do
		Conn:Disconnect()
	end
	self.ActiveConnections = {}
end

return Handler

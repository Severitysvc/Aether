local Creator = {}
Creator.Cache = {}
Creator.LabelsCache = {}

function Creator:New(ClassName, Properties)
	local Success, NewInstance = pcall(Instance.new, ClassName)
	if not Success then
		warn("Invalid ClassName: " .. tostring(ClassName))
		return nil
	end

	if Properties then
		for Property, Value in pairs(Properties) do
			NewInstance[Property] = Value
		end
	end

	table.insert(Creator.Cache, NewInstance)

	if ClassName == "TextLabel" then
		table.insert(Creator.LabelsCache, NewInstance)
	end

	return NewInstance
end

function Creator:GetTextLabels()
	return Creator.LabelsCache
end

return Creator

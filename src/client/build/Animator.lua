local Animator = {}
local TweenService = game:GetService("TweenService")

function Animator:Animate(Instance, Info, Properties)
	local Tween = TweenService:Create(Instance, Info, Properties)
	Tween:Play()

	return Tween
end

return Animator

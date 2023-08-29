local USWN = {}
USWN.ButtonRedir = {
	-- cardinal directions
	Up			= "Down",
	Down		= "Down",
	Left		= "Down",
	Right		= "Down",
	-- ordinal directions
	UpLeft		= "Down",
	UpRight		= "Down",
	DownLeft	= "Down",
	DownRight	= "Down",
	-- centre is center
	Center 		= "Center"
}
USWN.Rotate = {
	-- cardinal directions
	Up			= 180,
	Down		= 0,
	Left		= 90,
	Right		= -90,
	-- ordinal directions
	UpLeft		= 135,
	UpRight		= 225,
	DownLeft	= 45,
	DownRight	= -45,
	-- centre is center
	Center 		= 0
}
USWN.ElementRedir = {
	["Hold Head Inactive"]	= "Tap Note",
	["Roll Head Inactive"]	= "Tap Note",
	["Roll Explosion"]		= "Hold Explosion"
}
USWN.PartsToRotate = {
	["Receptor"]				= true,
	["Tap Explosion Bright"]	= true,
	["Tap Explosion Dim"]		= true,
	["Tap Note"]				= true,
	["Tap Fake"]				= true,
	["Tap Lift"]				= true,
	["Tap Addition"]			= true,
	["Hold Explosion"]			= true,
	["Hold Head Active"]		= true,
	["Hold Head Inactive"]		= true,
	["Roll Explosion"]			= true,
	["Roll Head Active"]		= true,
	["Roll Head Inactive"]		= true
}
USWN.Blank = {
	["Hold Explosion"]			= true,
	["Roll Explosion"]			= true,
	["Hold Tail Active"]		= true,
	["Hold Tail Inactive"]		= true,
	["Roll Tail Active"]		= true,
	["Roll Tail Inactive"]		= true
}

function USWN.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"
	local Button = USWN.ButtonRedir[sButton] or "Center"
	local Element = USWN.ElementRedir[sElement] or sElement

	if (not string.find(sElement, "Head") and not string.find(sElement,"Explosion")) and (string.find(sElement,"Hold") or string.find(sElement,"Roll")) then Button = sButton end
	if string.find(Element, "Tap Mine") then Button = "Down" end

	local t = LoadActor(NOTESKIN:GetPath(Button,Element))

	if USWN.Blank[sElement] then if Var "SpriteOnly" then t = LoadActor(NOTESKIN:GetPath("","_blank")) else t = Def.Actor{} end end
	if USWN.PartsToRotate[sElement] then t.BaseRotationZ = USWN.Rotate[sButton] or nil end
	if sElement == "Explosion" then t.BaseRotationZ = nil end

	return t
end

return USWN
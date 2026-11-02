local USWN = ... or {}
local counter = {[PLAYER_1]=0,[PLAYER_2]=0}

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
	-- center is center
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
	-- center is center
	Center 		= 0
}
USWN.PartsToRotate = {
	["Receptor"] = true,
	["Tap Explosion Bright"] = true,
	["Tap Explosion Dim"] = true,
	["Tap Note"] = true,
	["Tap Fake"] = true,
	["Tap Addition"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true
}
USWN.Blank = {
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold Tail Active"] = true,
	["Hold Tail Inactive"] = true,
	["Roll Tail Active"] = true,
	["Roll Tail Inactive"] = true,
	["Pit Tail Active"] = true,
	["Pit Tail Inactive"] = true
}

USWN.Load = function()
	local sButton = Var "Button"
	local sElement = Var "Element"
	local sPlayer = Var "Player"
	local Button = USWN.ButtonRedir[sButton] or "Center"

	if string.find(sElement,"Head") then sElement = "Tap Note" end

	local filePath = NOTESKIN:GetPath(Button,sElement)
	local t

	if filePath:sub(-3) == "lua" then
		if sElement == "Receptor" then
			t = loadfile(NOTESKIN:GetPath(Button,sElement))(sPlayer,counter[sPlayer],-USWN.Rotate[sButton])
			counter[sPlayer] = counter[sPlayer]+1
			if counter[sPlayer] >= GAMESTATE:GetCurrentStyle(sPlayer):ColumnsPerPlayer() then counter[sPlayer] = 0 end
		else
			t = loadfile(NOTESKIN:GetPath(Button,sElement))()
		end
	else
		t = Def.Sprite{Texture=NOTESKIN:GetPath(Button,sElement)}
	end

	if USWN.Blank[sElement] then if Var "SpriteOnly" then t = Def.Sprite{Texture=NOTESKIN:GetPath("","_blank")} else t = Def.Actor{} end end
	if USWN.PartsToRotate[sElement] then t.BaseRotationZ = USWN.Rotate[sButton] or nil end
	if sElement == "Explosion" then t.BaseRotationZ = nil end

	return t
end

return USWN
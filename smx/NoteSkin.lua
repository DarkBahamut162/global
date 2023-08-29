local USWN = ... or {}

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
	local Button = USWN.ButtonRedir[sButton] or "Center"

	if string.find(sElement,"Head") then sElement = "Tap Note" end

	local t = LoadActor(NOTESKIN:GetPath(Button,sElement))

	if USWN.Blank[sElement] then if Var "SpriteOnly" then t = LoadActor(NOTESKIN:GetPath("","_blank")) else t = Def.Actor{} end end
	if USWN.PartsToRotate[sElement] then t.BaseRotationZ = USWN.Rotate[sButton] or nil end
	if sElement == "Explosion" then t.BaseRotationZ = nil end
    if sElement == "Receptor" then
        t[#t+1] = Def.Sprite{
            Texture="_underglow",
            InitCommand=function(self) self:rotationz(-USWN.Rotate[sButton]):diffusealpha(0):valign(0):y(-20) end,
            PressCommand=function(self) self:stoptweening():zoomx(1):diffusealpha(1):decelerate(0.2):zoomx(0.9) end,
            LiftCommand=function(self) self:stoptweening():decelerate(0.2):diffusealpha(0):zoomx(0.75) end
        }
    end

	return t
end

return USWN
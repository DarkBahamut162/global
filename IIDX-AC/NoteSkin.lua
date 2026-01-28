local USWN = {}
USWN.ButtonRedir = {
	["DownLeft"] = "Left",
	["Left"] = "Left",
	["Down"] = "Down",
	["UpLeft"] = "Down",
	["Center"] = "Left",
	["Up"] = "Down",
	["UpRight"] = "Down",
	["Right"] = "Left",
	["DownRight"] = "Left",
	["Key1"] = "Key1",
	["Key2"] = "Key2",
	["Key3"] = "Key1",
	["Key4"] = "Key2",
	["Key5"] = "Key1",
	["Key6"] = "Key2",
	["Key7"] = "Key1",
	["scratch"] = "Scratch",
	["Foot"] = "Foot",
	["foot"] = "Foot",
	["Green"] = "Key1",
	["Left Green"] = "Key1",
	["Right Green"] = "Key1",
	["Red"] = "Key1",
	["Left Red"] = "Key1",
	["Right Red"] = "Key1",
	["White"] = "Key1",
	["Left White"] = "Key1",
	["Right White"] = "Key1",
	["Blue"] = "Key2",
	["Yellow"] = "Key2",
	["Left Blue"] = "Key2",
	["Right Blue"] = "Key2",
	["Left Yellow"] = "Key2",
	["Right Yellow"] = "Key2",
}
USWN.Rotate = {}
USWN.ElementRedir = {}
USWN.PartsToRotate = {
	["Go Receptor"] = false,
	["Ready Receptor"] = false,
	["Tap Explosion Bright"] = false,
	["Tap Explosion Dim"] = false,
	["Tap Note"] = false,
	["Hold Head Active"] = false,
	["Hold Head Inactive"] = false,
	["Roll Head Active"] = false,
	["Roll Head Inactive"] = false
}
USWN.Blank = {
	["Hold Topcap Active"] = true,
	["Hold Topcap Inactive"] = true,
	["Roll Topcap Active"] = true,
	["Roll Topcap Inactive"] = true,
	["Hold BottomCap Active"] = true,
	["Hold BottomCap Inactive"] = true,
	["Roll BottomCap Active"] = true,
	["Roll BottomCap Inactive"] = true
}

function USWN.Load()
	local sButton = Var "Button"
	local sElement = Var "Element"
	local Button = USWN.ButtonRedir[sButton] or "Down"
	local Element = USWN.ElementRedir[sElement] or sElement

	--if (not string.find(sElement, "Head") and not string.find(sElement,"Explosion")) and (string.find(sElement,"Hold") or string.find(sElement,"Roll")) then Button = sButton end
	--if string.find(Element, "Tap Mine") then Button = "Down" end

	local t = LoadActor(NOTESKIN:GetPath(Button,Element))

	if USWN.Blank[sElement] then if Var "SpriteOnly" then t = LoadActor(NOTESKIN:GetPath("","_blank")) else t = Def.Actor{} end end
	if USWN.PartsToRotate[sElement] then t.BaseRotationZ = USWN.Rotate[sButton] or 0 end
	if sElement == "Explosion" then t.BaseRotationZ = nil end

	return t
end

return USWN
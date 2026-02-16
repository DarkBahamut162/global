local beam = getenv("IIDXBeam"..pname(Var "Player")) or "default"
if beam == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local beams = { "none", "default", "orange", "pink", "monochrome", "onlyonebeam", "copula", "cannonballers", "heroicverse", "bistrover", "fresnelbeam", "resident", "epolis", "pinkycrush" }
	beam = beams[rng%(#beams)+1]
end
local length = getenv("IIDXBeamLength"..pname(Var "Player")) or "normal"
if length == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local lengths = { "long", "normal", "short", "veryshort" }
	length = lengths[rng%(#lengths)+1]
end

return Def.ActorFrame{
	Def.Quad { OnCommand=function(self) self:zoomto(2,9999):x(25):diffuse(color("#3B3B3B")) end },
	Def.Quad { OnCommand=function(self) self:zoomto(2,9999):x(-25):diffuse(color("#3B3B3B")) end },
	Def.Sprite {
		Texture="base light",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:addy(20):effectclock("beat"):zoomtowidth(50):blend('BlendMode_Add'):diffuseramp():effectcolor1(color("1,1,1,.2")):effectcolor2(color("1,1,1,1")):rotationz(180) end
	},
	Def.Sprite {
		Texture="RED_LINE",
		InitCommand=function(self) self:draworder(-9999):zoomtowidth(50) end
	},
	Def.Sprite {
		Texture="beam/"..beam.."/"..length.."/".."Tap1",
		OnCommand=function(self) self:basezoomx(0.92):rotationz(180) end,
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:y(4):finishtweening():blend('BlendMode_Add'):vertalign(bottom):diffusealpha(0) end,
		PressCommand=function(self) self:finishtweening():zoom(0):blend('BlendMode_Add'):diffusealpha(.35):decelerate(.05):zoom(1):diffusealpha(1) end,
		LiftCommand=function(self) self:decelerate(.2):diffusealpha(0):zoomx(0):zoomy(1.17) end,
		NoneCommand=function(self) self:finishtweening():diffusealpha(0) end
	},
	Def.Sprite {
		Texture="_Left Receptor",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function() end,
		NoneCommand=function() end,
		OnCommand=function(self) self:vertalign(top):y(-5):rotationz(180):zoomy(1.28) end
	},
	Def.Sprite {
		Texture="_ReceptorGlow",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end,
		NoneCommand=function() end,
		PressCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(1) end,
		LiftCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end,
		OnCommand=function(self) self:vertalign(top):y(-5):rotationz(180):zoomy(1.28) end
	},
	loadfile(NOTESKIN:GetPath("","_bomb"))()..{ InitCommand=function(self) self:draworder(9999) end }
}
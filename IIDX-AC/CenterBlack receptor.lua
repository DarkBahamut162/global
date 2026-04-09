local beam = getenv("IIDXBeam"..pname(Var "Player")) or "default"
local brightness = tonumber(getenv("IIDXBeamBrightness"..pname(Var "Player"))) or 1.0
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
local player = Var "Player"
local mods = false
local reverse = GAMESTATE:GetPlayerState(player):GetPlayerOptions('ModsLevel_Song'):UsingReverse()
if mods then reverse = not reverse end

return Def.ActorFrame{
	--Def.Quad { OnCommand=function(self) self:zoomto(50,9999):vertalign(reverse and bottom or top):diffuse(color("#808080")):diffusealpha(0.5) end },
	Def.Quad { OnCommand=function(self) self:zoomto(2,9999):x(25):diffuse(color("#3B3B3B")) end },
	Def.Quad { OnCommand=function(self) self:zoomto(2,9999):x(-25):diffuse(color("#3B3B3B")) end },
	Def.Sprite {
		Texture="base light",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:zoom(not reverse and 1 or -1):addy(not reverse and 20 or -20):effectclock("beat"):zoomtowidth(50):blend('BlendMode_Add'):diffuseramp():effectcolor1(color("1,1,1,.2")):effectcolor2(color("1,1,1,1")):rotationz(180) end
	},
	Def.Sprite {
		Texture="RED_LINE",
		InitCommand=function(self) self:draworder(-9999):zoomtowidth(50) end
	},
	Def.Sprite {
		Texture="beam/"..beam.."/"..length.."/".."Tap2",
		OnCommand=function(self) self:basezoomx(1.19):rotationz(180) end,
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:y(not reverse and 4 or -4):stoptweening():blend('BlendMode_Add'):vertalign(bottom):diffusealpha(0) end,
		PressCommand=function(self) self:stoptweening():zoom(0):blend('BlendMode_Add'):diffusealpha(.35*brightness):decelerate(.05):zoom(not reverse and 1 or -1):diffusealpha(brightness) end,
		LiftCommand=function(self) self:decelerate(.2):diffusealpha(0):zoomx(0):zoomy(not reverse and 1 or -1) end,
		NoneCommand=function(self) self:stoptweening():diffusealpha(0) end
	},
	Def.Sprite {
		Texture="_Down Receptor",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function() end,
		NoneCommand=function() end,
		OnCommand=function(self) self:vertalign(not reverse and top or bottom):y(not reverse and -5 or 5):rotationz(180) end
	},
	Def.Sprite {
		Texture="_ReceptorGlow",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end,
		NoneCommand=function() end,
		PressCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(brightness) end,
		LiftCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end,
		OnCommand=function(self) self:vertalign(not reverse and top or bottom):y(not reverse and -5 or 5):rotationz(180) end
	},
	loadfile(NOTESKIN:GetPath("","_bomb"))()..{ InitCommand=function(self) self:draworder(9999) end }
}
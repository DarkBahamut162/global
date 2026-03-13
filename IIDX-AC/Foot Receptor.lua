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
local mods = string.find(GAMESTATE:GetPlayerState(player):GetPlayerOptionsString("ModsLevel_Song"),"FlipUpsideDown")
local reverse = GAMESTATE:GetPlayerState(player):GetPlayerOptions('ModsLevel_Song'):UsingReverse()
if mods then reverse = not reverse end

local versionSplit = tonumber(split("-",ProductVersion())[1]:sub(1,3)) >= 0.5
if not versionSplit then
	local productCheck = ProductFamily() == "OutFox" or (isStepMania() and tonumber(split("-",ProductVersion())[1]) == 5.3)
	local versionCheck = tonumber(VersionDate()) >= 20201100
	if productCheck and versionCheck then reverse = not reverse end
end

return Def.ActorFrame{
	Def.Quad { OnCommand=function(self) self:zoomto(2,9999):x(21):diffuse(color("#3B3B3B")) end },
	Def.Quad { OnCommand=function(self) self:zoomto(2,9999):x(-21):diffuse(color("#3B3B3B")) end },
	Def.Sprite {
		Texture="base light",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:addx(0):addy(reverse and -20 or 20):effectclock("beat"):zoomtowidth(40):blend('BlendMode_Add'):diffuseramp():effectcolor1(color("1,1,1,.2")):effectcolor2(color("1,1,1,1")) end
	},
	Def.Sprite {
		Texture="beam/"..beam.."/"..length.."/".."Tap3",
		OnCommand=function(self) self:basezoomx(0.43) end,
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:y(reverse and 4 or -4):stoptweening():blend('BlendMode_Add'):vertalign(reverse and bottom or top):diffusealpha(0) end,
		PressCommand=function(self) self:stoptweening():zoom(0):blend('BlendMode_Add'):diffusealpha(.35*brightness):decelerate(.05):zoom(reverse and 1 or -1):diffusealpha(brightness) end,
		LiftCommand=function(self) self:decelerate(.2):diffusealpha(0):zoomx(0):zoomy(reverse and 1.5 or -1.5) end,
		NoneCommand=function(self) self:stoptweening():diffusealpha(0) end
	},
	Def.Sprite {
		Texture="Foot _ReceptorGlyph",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function() end,
		NoneCommand=function() end,
		OnCommand=function(self) self:vertalign(reverse and top or bottom):y(reverse and 10 or -10):diffusealpha(0.75) end
	},
	Def.Sprite {
		Texture="Foot _ReceptorGlow",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end,
		NoneCommand=function() end,
		PressCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(brightness) end,
		LiftCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end
	},
	loadfile(NOTESKIN:GetPath("","_bomb"))()..{ InitCommand=function(self) self:draworder(9999) end }
}
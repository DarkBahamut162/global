return Def.ActorFrame{
	Def.Sprite{
		Texture="_cen_receptor",
		InitCommand=function(self) self:basezoom(1.2):effectclock("beat"):diffuseramp():effectcolor1(color(".55,.55,.55,1")):effectcolor2(color("1,1,1,1")):effecttiming(0.2,0,0.8,0):effectoffset(0.05) end,
		NoneCommand=function(self) self:finishtweening():zoom(0.85):diffusealpha(0.9):linear(0.11):diffusealpha(1):zoom(1) end
	},
	Def.Sprite {
		Texture="_cenflash",
		InitCommand=function(self) self:basezoom(1.2):blend("BlendMode_Add"):diffusealpha(0) end,
		PressCommand=function(self) self:finishtweening():zoom(1):diffusealpha(1):decelerate(0.2):diffusealpha(0.9) end,
		LiftCommand=function(self) self:stoptweening():decelerate(0.2):diffusealpha(0):zoom(1.2) end
	}
}
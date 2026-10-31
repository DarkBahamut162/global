local reverse = ...
return Def.ActorFrame{
	Def.Sprite {
		Texture="texture/copula.png",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:zoom(0.5):addy(reverse and 56 or -56):spin():effectmagnitude(0,0,360) end,
		PressCommand=function(self) self:finishtweening():effectmagnitude(0,0,-540) end,
		LiftCommand=function(self) self:finishtweening():effectmagnitude(0,0,360) end
	}
}
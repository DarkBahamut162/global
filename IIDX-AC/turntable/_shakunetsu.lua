return Def.ActorFrame{
	Def.Sprite {
		Texture="texture/shakunetsu.png",
		Frame0000=0,
		Delay0000=1,
		InitCommand=function(self) self:zoom(0.5):addy(56):spin():effectmagnitude(0,0,360) end,
		PressCommand=function(self) self:finishtweening():effectmagnitude(0,0,-540) end,
		LiftCommand=function(self) self:finishtweening():effectmagnitude(0,0,360) end
	}
}
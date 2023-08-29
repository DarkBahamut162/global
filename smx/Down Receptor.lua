return Def.ActorFrame{
	Def.Sprite{
		Texture=NOTESKIN:GetPath( '_down','Receptor Go'),
		Frames=Sprite.LinearFrames(4,4),
		InitCommand=function(self) self:effectclock("beat"):diffuseramp():effectcolor1(0.1,0.1,0.1,1):effectcolor2(1,1,1,1):effectperiod(0.5):effecttiming(0.25,0.50,0,0.25):effectoffset(-0.25) end,
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand"),
		PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand"),
		LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand"),
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command"),
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command"),
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command"),
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command"),
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command")
	},
	Def.Sprite{
		Texture=NOTESKIN:GetPath('_down','Receptor Go'),
		Frames={
			{Frame=0,Delay=0.25},
			{Frame=1,Delay=1},
			{Frame=2,Delay=1},
			{Frame=3,Delay=1},
			{Frame=0,Delay=0.75}
		},
		InitCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0) end,
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand"),
		PressCommand=function(self) self:diffusealpha(0.2) end,
		LiftCommand=function(self) self:diffusealpha(0) end,
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command"),
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command"),
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command"),
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command"),
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command")
	}
}
--If a Command has "NOTESKIN:GetMetricA" in it, that means it gets the command from the metrics.ini, else use cmd(); to define command.
--If you dont know how "NOTESKIN:GetMetricA" works here is an explanation.
--NOTESKIN:GetMetricA("The [Group] in the metrics.ini", "The actual Command to fallback on in the metrics.ini");

local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'Receptor Go' );
		--Frames=Sprite.LinearFrames( 8, 1 );
		Frames= {
			{Frame= 0, Delay= 0.1},
			{Frame= 1, Delay= 0.1},
			{Frame= 2, Delay= 0.1},
			{Frame= 3, Delay= 0.1},
			{Frame= 4, Delay= 0.1},
			{Frame= 5, Delay= 0.1},
			{Frame= 6, Delay= 0.1},
			{Frame= 7, Delay= 0.3},
		};
		InitCommand=function(self) self:effectclock("beat") end;
		NoneCommand=NOTESKIN:GetMetricA("ReceptorArrow", "NoneCommand");
		PressCommand=NOTESKIN:GetMetricA("ReceptorArrow", "PressCommand");
		LiftCommand=NOTESKIN:GetMetricA("ReceptorArrow", "LiftCommand");
		W5Command=NOTESKIN:GetMetricA("ReceptorArrow", "W5Command");
		W4Command=NOTESKIN:GetMetricA("ReceptorArrow", "W4Command");
		W3Command=NOTESKIN:GetMetricA("ReceptorArrow", "W3Command");
		W2Command=NOTESKIN:GetMetricA("ReceptorArrow", "W2Command");
		W1Command=NOTESKIN:GetMetricA("ReceptorArrow", "W1Command");
	};
};
return t;

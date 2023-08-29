local t = Def.ActorFrame {
	Def.Sprite {
		Texture="materials/_lift";
		Frame0000=0;
		Delay0000=1;		
		InitCommand=cmd(y,13);
	};
};
return t;
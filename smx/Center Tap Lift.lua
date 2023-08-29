local t = Def.ActorFrame {
	Def.Sprite {
		Texture="materials/_lift";
		Frame0000=0;
		Delay0000=1;		
		InitCommand=cmd(y,9;zoom,0.7);
	};
};
return t;
local t = Def.ActorFrame {
	Def.Sprite {
		Texture=NOTESKIN:GetPath( '_down', 'tap mine' );
		Frames = Sprite.LinearFrames( 8, 1 );
		InitCommand=function(self) self:effectclock("beat") end;
	};
};
return t;

local t = Def.Model {
	InitCommand=cmd(ztest,false;basezoom,FIXUP*.75);
	Meshes=NOTESKIN:GetPath('_mine','model');
	Materials=NOTESKIN:GetPath('_mine','model');
	Bones=NOTESKIN:GetPath('_mine','model');
};

return t;
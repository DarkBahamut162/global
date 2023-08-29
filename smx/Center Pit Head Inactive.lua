local t = Def.Model {
	InitCommand=cmd(ztest,false;basezoom,FIXUP*.75);
	Meshes=NOTESKIN:GetPath('_pit','model');
	Materials=NOTESKIN:GetPath('_pit','model');
	Bones=NOTESKIN:GetPath('_pit','model');
};

return t;

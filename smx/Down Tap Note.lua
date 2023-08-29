local t = Def.Model {
	InitCommand=cmd(ztest,false;basezoom,FIXUP);
	Meshes=NOTESKIN:GetPath('_down','tap note model');
	Materials=NOTESKIN:GetPath('_down','tap note model');
	Bones=NOTESKIN:GetPath('_down','tap note model');
};

return t;

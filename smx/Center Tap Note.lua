local t = Def.Model {
	InitCommand=cmd(ztest,false;basezoom,FIXUP);
	Meshes=NOTESKIN:GetPath('_center','tap note model');
	Materials=NOTESKIN:GetPath('_center','tap note model');
	Bones=NOTESKIN:GetPath('_center','tap note model');
};

return t;

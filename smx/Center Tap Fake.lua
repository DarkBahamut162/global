return Def.Model {
	InitCommand=function(self) self:basezoom(1.2) end,
	Meshes=NOTESKIN:GetPath('_center','tap note model'),
	Materials=NOTESKIN:GetPath('_center','tap fake material'),
	Bones=NOTESKIN:GetPath('_center','tap note model')
}
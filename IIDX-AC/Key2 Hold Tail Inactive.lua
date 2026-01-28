local note = getenv("IIDXNote"..pname(Var "Player")) or "default"
if note == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local notes = { "default", "gorgeous", "aqua", "gyaru", "photon", "pastel", "simplecolor", "light", "tricoro", "bubble" }
	note = notes[rng%(#notes)+1]
end
local length = getenv("IIDXNoteLength"..pname(Var "Player")) or "normal"
if length == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local lengths = { "long", "normal", "short", "veryshort" }
	length = lengths[rng%(#lengths)+1]
end

return Def.Sprite {
	Texture="notes/"..note.."/"..length.."/hold/notes_cn_black_start.png",
	InitCommand=function(self) self:basezoom(0.75) end
}
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

return Def.ActorFrame{
	Def.Sprite {
		Texture="notes/"..note.."/"..length.."/notes_black.png",
		InitCommand=function(self) self:zoomtowidth(64) end
	}
}
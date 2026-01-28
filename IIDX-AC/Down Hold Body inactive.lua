local note = getenv("IIDXNote"..pname(Var "Player")) or "default"
if note == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local notes = { "default", "gorgeous", "aqua", "gyaru", "photon", "pastel", "simplecolor", "light", "tricoro", "bubble" }
	note = notes[rng%(#notes)+1]
end

return Def.Sprite {
	Texture="notes/"..note.."/hold/notes_down_beam0.png"
}
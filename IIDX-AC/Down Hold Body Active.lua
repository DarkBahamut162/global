local note = getenv("IIDXNote"..pname(Var "Player")) or "default"
if note == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local notes = { "default", "gorgeous", "aqua", "gyaru", "photon", "pastel", "simplecolor", "light", "tricoro", "bubble" }
	note = notes[rng%(#notes)+1]
end

return Def.Sprite {
	Texture="notes/"..note.."/hold/notes_down_beam1 2x1.png",
	Frame0000=0,
	Delay0000=0.25,
	Frame0001=1,
	Delay0001=0.25,
	HoldingOnCommand=function(self) self:blend('BlendMode_Add') end
}
local reverse = ...
local turntable = getenv("IIDXTurntable"..pname(Var "Player")) or "_default"
if turntable == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local turntables = { "_default", "_tran", "_jojo", "_delta", "_orangedisc", "_distorted", "_gold", "_troopers", "_empress", "_sirius", "_resortanthem", "_lincle", "_tricoro", "_spada", "_shakunetsu", "_onlyonerecord", "_pendual", "_copula", "_sinobuz", "_cannonballers", "_rootage", "_heroicverse", "_casthour", "_resident", "_strawberry", "_epolis", "_pinkycrush" }
	turntable = turntables[rng%(#turntables)+1]
end

return Def.ActorFrame{ loadfile(NOTESKIN:GetPath("","turntable/"..turntable))(reverse) }
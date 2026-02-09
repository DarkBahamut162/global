
local explosion = getenv("IIDXExplosion"..pname(Var "Player")) or "_default"
if explosion == "random" then
	local rng = GAMESTATE:GetStageSeed()
	local explosions = { "_default", "_1st", "_9th", "_red", "_happysky", "_distorted", "_gold", "_troopers", "_empress", "_sirius", "_resortanthem", "_lincle", "_tricoro", "_spada", "_onlyonebomb", "_pendual", "_copula", "_sinobuz", "_cannonballers", "_rootage", "_heroicverse", "_bistrover", "_likeflash", "_resident", "_epolis", "_pinkycrush", "_sparkleshower" }
	explosion = explosions[rng%(#explosions)+1]
end

return Def.ActorFrame{
	loadfile(NOTESKIN:GetPath("","explosion/"..explosion))()..{
		InitCommand=function(self) self:diffusealpha(0) end,
		NoneCommand=function(self) self:diffusealpha(0) end,
		PressCommand=function(self) self:diffusealpha(0) end,
		W5Command=function(self) self:stoptweening():zoom(2.07):blend('BlendMode_Add'):loop(0):diffusealpha(1):setstate(0):sleep(self:GetAnimationLengthSeconds()):diffusealpha(0) end,
		W4Command=function(self) self:stoptweening():zoom(2.07):blend('BlendMode_Add'):loop(0):diffusealpha(1):setstate(0):sleep(self:GetAnimationLengthSeconds()):diffusealpha(0) end,
		W3Command=function(self) self:stoptweening():zoom(2.07):blend('BlendMode_Add'):loop(0):diffusealpha(1):setstate(0):sleep(self:GetAnimationLengthSeconds()):diffusealpha(0) end,
		W2Command=function(self) self:stoptweening():zoom(2.07):blend('BlendMode_Add'):loop(0):diffusealpha(1):setstate(0):sleep(self:GetAnimationLengthSeconds()):diffusealpha(0) end,
		W1Command=function(self) self:stoptweening():zoom(2.07):blend('BlendMode_Add'):loop(0):diffusealpha(1):setstate(0):sleep(self:GetAnimationLengthSeconds()):diffusealpha(0) end,
		MissCommand=function(self) self:diffusealpha(0) end
	}
}
local pn,index,rotate = ...
local totalDelta = 0
local tmpDelta = 0

local function Update(self,delta)
	totalDelta = totalDelta + delta
	if totalDelta - tmpDelta > 1/60 then
		tmpDelta = totalDelta
        local reverse = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Song"):GetReversePercentForColumn(index) > 0.5
        self:GetChild("UnderGlow"):rotationz(rotate-(reverse and 180 or 0))
    end
end

return Def.ActorFrame{
    InitCommand=function(self) self:SetUpdateFunction(Update) end,
	Def.Sprite{
		Texture="_receptor",
		InitCommand=function(self) self:effectclock("beat"):diffuseramp():effectcolor1(color(".55,.55,.55,1")):effectcolor2(color("1,1,1,1")):effecttiming(0.2,0,0.8,0):effectoffset(0.05) end,
		NoneCommand=function(self) self:finishtweening():zoom(0.85):diffusealpha(0.9):linear(0.11):diffusealpha(1):zoom(1) end
	},
	Def.Sprite {
		Texture="_rflash",
		InitCommand=function(self) self:blend("BlendMode_Add"):diffusealpha(0) end,
		PressCommand=function(self) self:finishtweening():zoom(1):diffusealpha(1):decelerate(0.2):diffusealpha(0.9) end,
		LiftCommand=function(self) self:stoptweening():decelerate(0.2):diffusealpha(0):zoom(1.2) end
	},
	Def.Sprite{
		Name="UnderGlow",
		Texture="_underglow",
		InitCommand=function(self) self:rotationz(rotate):zoomy(2):diffusealpha(0):valign(0) end,
		PressCommand=function(self) self:stoptweening():zoomx(1):diffusealpha(1):decelerate(0.2):zoomx(0.9) end,
		LiftCommand=function(self) self:stoptweening():decelerate(0.2):diffusealpha(0):zoomx(0.75) end
	}
}
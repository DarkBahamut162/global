local ret = ... or {}

ret.PartsToRotate =
{
	["Tap Note"] = true,
	["Tap Lift"] = false,
	["Tap Fake"] = true,
	["Ready Receptor"] = true,
	["Hold Head Active"] = true,
	["Hold Head Inactive"] = true,
	["Roll Head Active"] = true,
	["Roll Head Inactive"] = true,
	["Run Head Active"] = true,
	["Run Head Inactive"] = true,
	["Pit Head Active"] = false,
	["Pit Head Inactive"] = false,
}

ret.RedirTable =
{
	Up        = "Down",
	Down      = "Down",
	Left      = "Down",
	Right     = "Down",
	Center    = "Center",
        UpP2      = "Down",
        DownP2    = "Down",
        LeftP2    = "Down",
        RightP2   = "Down",
        CenterP2  = "Center",
}

ret.Rotate =
{
	Up        = 180,
	Down      = 0,
	Left      = 90,
	Right     = -90,
	Center    = 0,
	UpP2      = 180,
	DownP2    = 0,
	LeftP2    = 90,
	RightP2   = -90,
	CenterP2  = 0,
}

ret.Blank =
{
	["Hold Tail Active"]     = true,
	["Hold Tail Inactive"]   = true,
	["Roll Tail Active"]     = true,
	["Roll Tail Inactive"]   = true,
	["Pit Tail Active"]     = true,
	["Pit Tail Inactive"]   = true,
};

function MakeReceptor(sButton, sElement)
        local sButtonToLoad = ret.RedirTable[sButton]
        local rotation = ret.Rotate[sButton];
        local NoneCommand=cmd(finishtweening;zoom,.85;diffusealpha,.9;linear,.11;diffusealpha,1;zoom,1);

        local t = Def.ActorFrame {
                TracksActiveCommand=function(self, param)
                        -- Dim receptors for tracks that have no notes in this song.
                        self:diffusealpha(param.Tracks[sButton] and 1 or 0.25);
                end;

                Def.Sprite {
                        Texture="_underglow";
                        InitCommand=cmd(diffusealpha,0;vertalign,0;y,-20);
                        PressCommand=cmd(stoptweening;zoomx,1;diffusealpha,1;decelerate,0.2;zoomx,.9;);
                        LiftCommand=cmd(stoptweening;decelerate,.2;diffusealpha,0;zoomx,.75);
                };
                Def.Sprite {
                        Texture=sButtonToLoad == "Center" and "_cen_receptor" or "_receptor";
                        BaseRotationZ = ret.Rotate[sButton];
                        InitCommand=cmd(effectclock,"beat";diffuseramp;effectcolor1,color(".55,.55,.55,1");effectcolor2,color("1,1,1,1");effecttiming,.2,0,.8,0;effectoffset,.05);
                        NoneCommand=NoneCommand;                        
                };
                Def.Sprite {
                        Texture=sButtonToLoad == "Center" and "_cenflash" or "_rflash";
                        BaseRotationZ = ret.Rotate[sButton];
                        InitCommand=cmd(blend,"BlendMode_Add";diffusealpha,0);
                        PressCommand=cmd(finishtweening;zoom,1;diffusealpha,1;decelerate,0.2;diffusealpha,0.9);
                        LiftCommand=cmd(stoptweening;decelerate,.2;diffusealpha,0;zoom,1.2);
                };
        };
        return t;
end

local function MakeExplosion(sButton, sElement)
        return Def.ActorFrame {
                -- Hold explosion:
                NOTESKIN:LoadActor( sButton, "Tap Explosion Bright" ) .. {
                        HoldingOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOnCommand");
                        HoldingOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "HoldingOffCommand");
                        InitCommand=cmd(playcommand,"HoldingOff";finishtweening);
                        BaseRotationZ=ret.Rotate[sButton];
                };
            
                -- Roll explosion:
                NOTESKIN:LoadActor( sButton, "Tap Explosion Bright" ) .. {
                        RollOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOnCommand");
                        RollOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "RollOffCommand");
                        InitCommand=cmd(playcommand,"RollOff";finishtweening);
                        BaseRotationZ=ret.Rotate[sButton];
                };

                -- Pit and Mine explosion:
                NOTESKIN:LoadActor( sButton, "Tap Explosion Bright" ) .. {
                        PitOnCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "PitOnCommand");
                        PitOffCommand=NOTESKIN:GetMetricA("HoldGhostArrow", "PitOffCommand");
                        HitMineCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HitMineCommand");
                        InitCommand=cmd(playcommand,"PitOff";finishtweening);
                        BaseRotationZ=ret.Rotate[sButton];
                };

                -- Tap explosions:
                NOTESKIN:LoadActor( sButton, "Tap Explosion Dim" ) .. {
                        InitCommand=cmd(blend,"BlendMode_Add";diffusealpha,0);
                        W12Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W11Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W10Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
                        W9Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
                        W8Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
                        W7Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
                        W6Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
                        W3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
                        W2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W2Command");
                        W1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
                        HeldCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HeldCommand");
                        --JudgmentCommand=cmd(finishtweening);
                        BrightCommand=cmd(visible,false);
                        DimCommand=cmd(visible,true);
                        BaseRotationZ=ret.Rotate[sButton];
                };
                NOTESKIN:LoadActor( sButton, "Tap Explosion Bright" ) .. {
                        InitCommand=cmd(blend,"BlendMode_Add";diffusealpha,0);
                        W12Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W11Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W10Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
                        W9Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
                        W8Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
                        W7Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
                        W6Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W5Command=NOTESKIN:GetMetricA("GhostArrowBright", "W5Command");
                        W4Command=NOTESKIN:GetMetricA("GhostArrowBright", "W4Command");
                        W3Command=NOTESKIN:GetMetricA("GhostArrowBright", "W3Command");
                        W2Command=NOTESKIN:GetMetricA("GhostArrowBright", "W2Command");
                        W1Command=NOTESKIN:GetMetricA("GhostArrowBright", "W1Command");
                        HeldCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HeldCommand");
                        --JudgmentCommand=cmd(finishtweening);
                        BrightCommand=cmd(visible,true);
                        DimCommand=cmd(visible,false);
                        BaseRotationZ=ret.Rotate[sButton];
                };
                NOTESKIN:LoadActor( sButton, "HitMine Explosion" ) .. {
                        InitCommand=cmd(blend,"BlendMode_Add";diffusealpha,0);
                        HitMineCommand=NOTESKIN:GetMetricA("GhostArrowBright", "HitMineCommand");
                };
        }
end

ret.Load = function()
	local sButton = Var "Button";
	local sElement = Var "Element";

	if ret.Blank[sElement] then
		-- Return a blank element.  If SpriteOnly is set,
		-- we need to return a sprite; otherwise just return
		-- a dummy actor.
		local t;
		if Var "SpriteOnly" then
			t = LoadActor( "_blank" );
		else
			t = Def.Actor {};
		end
		return t .. {
			cmd(visible,false);
		};
	end

        -- Point the head files back to the tap note
        local sElementToLoad = sElement;
        if string.find(sElement, "Head") or sElement == "Tap Fake" then
            if not string.find(sElement, "Pit") then
                sElementToLoad = "Tap Note"
            end
        end

        local sButtonToLoad = ret.RedirTable[sButton]
	assert( sButtonToLoad );

        local t;
        if sElement == "Receptor" then
                t = MakeReceptor(sButton, sElement);
        elseif sElement == "Explosion" then
                t = MakeExplosion(sButton, sElement);
        else
                local sPath = NOTESKIN:GetPath( sButtonToLoad, sElementToLoad );
                t = LoadActor( sPath );
        end

	if ret.PartsToRotate[sElement] then
		t.BaseRotationZ = ret.Rotate[sButton];
	end

	return t
end

return ret

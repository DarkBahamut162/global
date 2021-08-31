local USWN = {};

-- [1.] Button Redirects
-- Defining on which direction the other directions should be based on
-- This will let us use less files which is quite handy to keep the noteskin directory nice
-- Do remember this will redirect all the files of that direction to the direction its pointed to
USWN.ButtonRedir = {
	-- cardinal directions
	Up			= "Down",
	Down		= "Down",
	Left		= "Down",
	Right		= "Down",
	-- ordinal directions
	UpLeft		= "Down",
	UpRight		= "Down",
	DownLeft	= "Down",
	DownRight	= "Down",
	-- centre is center
	Center 		= "Center",
};

-- [2.] Rotation
-- Define the parts to be rotated at which degree
USWN.Rotate = {
	-- cardinal directions
	Up			= 180,
	Down		= 0,
	Left		= 90,
	Right		= -90,
	-- ordinal directions
	UpLeft		= 135,
	UpRight		= 225,
	DownLeft	= 45,
	DownRight	= -45,
	-- centre is center
	Center 		= 0,
};

-- [3.] Element Redirects
-- Define elements that need to be redirected
USWN.ElementRedir = {
	["Tap Fake"]			= "Tap Note",
	["Hold Head Inactive"]	= "Tap Note",
	["Roll Head Inactive"]	= "Tap Note",
	["Roll Explosion"]		= "Hold Explosion",
};

-- [4.] Element Rotations
-- Parts of noteskins which we want to rotate
-- Tap Explosions are set to false as they'll be rotated in aFallback Explosion
USWN.PartsToRotate = {
	["Receptor"]				= true,
	["Tap Explosion Bright"]	= true,
	["Tap Explosion Dim"]		= true,
	["Tap Note"]				= true,
	["Tap Fake"]				= true,
	["Tap Lift"]				= true,
	["Tap Addition"]			= true,
	["Hold Explosion"]			= true,
	["Hold Head Active"]		= true,
	["Hold Head Inactive"]		= true,
	["Roll Explosion"]			= true,
	["Roll Head Active"]		= true,
	["Roll Head Inactive"]		= true,
};

-- [5.] Blank Redirects
-- Parts that should be Redirected to _Blank.png
-- you can add/remove stuff if you want
USWN.Blank = {
	["Hold Explosion"]			= true,
	["Roll Explosion"]			= true,
	["Hold Tail Active"]		= true,
	["Hold Tail Inactive"]		= true,
	["Roll Tail Active"]		= true,
	["Roll Tail Inactive"]		= true,
};

-- [6.] Buttons and Elements
-- Between here we usally put all the commands the noteskin.lua needs to do, some are extern in other files
-- If you need help with lua go to https://quietly-turning.github.io/Lua-For-SM5/Luadoc/Lua.xml there are a bunch of codes there
-- Also check out common it has a load of lua codes in files there
-- Just play a bit with lua its not that hard if you understand coding
-- But SM can be a bum in some cases, and some codes jut wont work if you dont have the noteskin on FallbackNoteSkin=common in the metric.ini
function USWN.Load()
	local sButton = Var "Button";
	local sElement = Var "Element";

	-- [6a.] Global Elements
	-- This is where arguments related to all gametypes are covered.

	-- Setting global button
	local Button = USWN.ButtonRedir[sButton] or "Center"

	-- Setting global element
	local Element = USWN.ElementRedir[sElement] or sElement

	--Use diffrent Holds/Rolls for every direction
	if ( not string.find(sElement, "Head") and not string.find(sElement, "Explosion") ) and ( string.find(sElement, "Hold") or string.find(sElement, "Roll") ) then
		Button = sButton
	end

	-- Only one kind of mine is used
	if string.find(Element, "Tap Mine") then
		Button = "Down"
	end

	-- [6b.] Others
	-- Returning first part of the code, the redirects, Second part is for commands
	local t = LoadActor(NOTESKIN:GetPath(Button,Element));

	--Set blank redirects
	if USWN.Blank[sElement] then
		t = Def.Actor {};
		--Check if element is sprite only
		if Var "SpriteOnly" then
			t = LoadActor(NOTESKIN:GetPath("","_blank"));
		end
	end

	if USWN.PartsToRotate[sElement] then
		t.BaseRotationZ = USWN.Rotate[sButton] or nil;
	end

	--Explosion should not be rotated, It calls other actors
	if sElement == "Explosion" then
		t.BaseRotationZ = nil;
	end

	return t;
end
-- >

-- Don't forget to return because else it won't work
return USWN;

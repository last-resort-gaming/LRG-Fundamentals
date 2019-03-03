// not documented: action handler

params ["_target", "_caller", "_id", "_arguments"];

// Don't load if ACE is detected - it contains plugs
if (isClass(configFile >> "CfgPatches" >> "ace_main")) exitWith {};

// We default to plugs out
if(isNil "YAINA_PlugsIn") then { YAINA_PlugsIn = false; };

if (YAINA_PlugsIn isEqualTo true) then {

    ([2, 0] select isNil "_target") fadeSound 0.2;
	_ID =[
        
		player,
		"<t color='#FF0000'>Remove Earplugs</t>",
		"z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\plugs_out.paa",
		"z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\plugs_out.paa",
		"_target == _this",
		"true",
		{},
		{},
		{   
            YAINA_PlugsIn = false;
            [] execVM "z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\earplugs.sqf";
            ["<img image='z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\plugs_out.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Removed</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
        },
		{},
		[],
		0.5,
		-91,
		true,
		false
	] call BIS_fnc_holdActionAdd;
};

if (YAINA_PlugsIn isEqualTo false) then {

    ([2, 0] select isNil "_target") fadeSound 1;
	[
        
		player,
		"<t color='#00FF00'>Insert Earplugs</t>",
		"z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\plugs_in.paa",
		"z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\plugs_in.paa",
		"_target == _this",
		"true",
		{},
		{},
		{   
            YAINA_PlugsIn = true;
            [] execVM "z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\earplugs.sqf";
            ["<img image='z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\plugs_in.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Fitted</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
        },
		{},
		[],
		0.5,
		-91,
		true,
		false
	] call BIS_fnc_holdActionAdd;
};
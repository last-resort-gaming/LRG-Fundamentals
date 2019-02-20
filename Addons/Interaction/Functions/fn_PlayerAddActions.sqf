// not documented: postInit

if (!hasinterface) exitwith {};

if (player getUnitTrait "Mission Maker") then {
	[
		player,
		"missionComplete",
		"<t color='#27e833'>Mission Complete</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa",
		"true",
		"true",
		{ hint "You're Completing the Mission." },
		{},
		{"EveryoneWon" remoteExec ["BIS_fnc_endMissionServer", 2];},
		{ hint "You've Cancelled Mission Completion." },
		[],
		5,
		true,
		"Completing Mission",
		false
	] call LR_fnc_AddHoldAction;

	[
		player,
		"missionFail",
		"<t color='#cc3232'>Mission Failed</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsDown_ca.paa",
		"true",
		"true",
		{ hint "You're Failing the Mission." },
		{},
		{"EveryoneLost" remoteExec ["BIS_fnc_endMissionServer", 2];},
		{ hint "You've Cancelled Mission Failure." },
		[],
		5,
		true,
		"Failing Mission",
		false
	] call LR_fnc_AddHoldAction;
};

if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

if (isNil "LRG_Main_QSMagRepack") exitwith {};
if (not LRG_Main_QSMagRepack) exitWith{};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

player addAction ["Repack Magazines", "player spawn LR_fnc_clientRepackMagazines","",-98,false,true];

/*
	LRG MISSION TEMPLATE
	fn_InitPlayerLocal.sqf
	Author: MitchJC
	Description: Scripts executed on players only.
*/

if (!hasInterface) exitWith {};

//=================================== GENERAL =====================================================

	if (ShowMapIcons) 		then {_null = [] execVM "scripts\QS\QS_icons.sqf";};	

	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[] execVM "scripts\YAINA\earplugs.sqf";
		["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
		player enableFatigue false;
	};
	  
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		player setVariable ["tf_sendingDistanceMultiplicator", RadioRange];
	} else {
	1 enableChannel [true, true];
	2 enableChannel [true, true];
	3 enableChannel [true, true];
	4 enableChannel [true, true];
	5 enableChannel [true, true];
	};

	if (servername == "[LRG] Last Resort Gaming || EU 3 || Operations") then {
	
	_log = format ["%1 attended as %2.",name player, roleDescription player ];	
	[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
	
	};

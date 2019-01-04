/*
	LRG MISSION TEMPLATE
	fn_InitPlayerLocal.sqf
	Author: MitchJC
	Description: Scripts executed on players only.
*/

//=================================== GENERAL =====================================================

params [
"_VehicleCrewListEnable",
"_MapIconsEnable",
"_ArsenalSaveLoad",
"_TFARTransmitRange",
"_TFARTerrainInterference"
];

	if (_VehicleCrewListEnable) then {call YAINA_fnc_crewNames;};
	if (_MapIconsEnable) then { _null = [] execVM "LRG Fundamentals\General\scripts\QS\QS_icons.sqf";};

	// ACE Client calls.
	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[] execVM "LRG Fundamentals\General\scripts\YAINA\earplugs.sqf";
		["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
		player enableFatigue false;

		call LR_fnc_AddCueCards;	
	};
	
	if !(_ArsenalSaveLoad) then {call LR_fnc_ArsenalLoadSave};
	call LR_fnc_Diary;
	call LR_fnc_InitCreatorActions;
	call LR_fnc_PilotCheck;
	call LR_fnc_AddCueCards;
	
	if (servername == "[LRG] Last Resort Gaming || EU 3 || Operations") then {

		_log = format ["%1 attended as %2.",name player, roleDescription player ];	
		[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
	};
	
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		player setVariable ["tf_sendingDistanceMultiplicator", _TFARTransmitRange];
		player setVariable ["TF_terrain_interception_coefficient", _TFARTerrainInterference];
	} else {
		1 enableChannel [true, true];
		2 enableChannel [true, true];
		3 enableChannel [true, true];
		4 enableChannel [true, true];
		5 enableChannel [true, true];
	};

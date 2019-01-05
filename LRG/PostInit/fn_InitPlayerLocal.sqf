/*
	LRG MISSION TEMPLATE
	fn_InitPlayerLocal.sqf
	Author: MitchJC
	Description: Scripts executed on players only.
*/

//=================================== GENERAL =====================================================

if !(hasinterface) exitwith {};
	
	if (servername == "[LRG] Last Resort Gaming || EU 3 || Operations") then {

		_log = format ["%1 attended as %2.",name player, roleDescription player ];	
		[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
	};

	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {

		[] execVM "LRG Fundamentals\General\scripts\YAINA\earplugs.sqf";
		["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
		if (isNil "FatigueVanilla") then {FatigueVanilla = true};
		player enableFatigue FatigueVanilla;
	};

	// ====== TFAR Only Client Calls

		if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
			if (isNil "TFARTransmitRange") exitwith {};
			player setVariable ["tf_sendingDistanceMultiplicator", TFARTransmitRange];
			if (isNil "TFARTerrainInterference") exitwith {};
			player setVariable ["TF_terrain_interception_coefficient", TFARTerrainInterference];
	};

enableSaving [false, false];




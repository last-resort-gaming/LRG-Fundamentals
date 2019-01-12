/*
	LRG MISSION TEMPLATE
	fn_InitPlayerLocal.sqf
	Author: MitchJC
	Description: Scripts executed on players only.
*/

//=================================== GENERAL =====================================================

if !(hasinterface) exitwith {};

if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

	if (servername == "[LRG] Last Resort Gaming || EU 3 || Operations") then {

		_log = format ["%1 attended as %2.",name player, roleDescription player ];	
		[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
	};

	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {

		[] execVM "LRG Fundamentals\General\scripts\YAINA\earplugs.sqf";
		["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
		if (isNil "LRG_Main_FatigueVanilla") then {LRG_Main_FatigueVanilla = true};
		player enableFatigue LRG_Main_FatigueVanilla;
	};

	// ====== TFAR Only Client Calls

		if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
			if (isNil "LRG_Main_TFARTransmitRange") exitwith {};
			player setVariable ["tf_sendingDistanceMultiplicator", LRG_Main_TFARTransmitRange];
			if (isNil "LRG_Main_TFARTerrainInterference") exitwith {};
			player setVariable ["TF_terrain_interception_coefficient", LRG_Main_TFARTerrainInterference];
	};

enableSaving [false, false];




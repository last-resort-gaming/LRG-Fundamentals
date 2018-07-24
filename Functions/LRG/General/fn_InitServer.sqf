/*
	LRG MISSION TEMPLATE
	fn_InitServer.sqf
	Author: MitchJC
	Description: Scripts executed on server only.
*/
if (not LR_start) exitWith{};

enableSaving [false, false];

if (!isserver) exitwith {};

{_x setSpeaker "NoVoice"} forEach playableUnits;

//=================================== VANILLA ONLY =====================================================
		
		
	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
	};

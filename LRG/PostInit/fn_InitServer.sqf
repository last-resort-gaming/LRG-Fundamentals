/*
	LRG MISSION TEMPLATE
	fn_InitServer.sqf
	Author: MitchJC
	Description: Scripts executed on server only.
*/

enableSaving [false, false];

call LR_fnc_DynamicSim;
call LR_fnc_Logs;

if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

{_x setSpeaker "NoVoice"} forEach playableUnits;


/*
	LRG MISSION TEMPLATE
	fn_InitServer.sqf
	Author: MitchJC
	Description: Scripts executed on server only.
*/



enableSaving [false, false];
{_x setSpeaker "NoVoice"} forEach playableUnits;

if (!IsServer) exitwith {};

if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};


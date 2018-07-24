/*
	LRG MISSION TEMPLATE
	fn_PreInit.sqf
	Author: MitchJC
	Description: Calls LRG_Setup prior to functions.
*/

if (hasInterface && {!(["LRG_Setup.sqf"] call LR_fnc_fileExists)}) exitwith { LR_start = false; };
call compile preprocessFileLineNumbers "LRG_Setup.sqf";
LR_start = true;


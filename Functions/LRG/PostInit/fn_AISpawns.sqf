/*
Function: LR_fnc_AISpawns

Description:
	Calls the predefined AI spawn batches defined in the mission in file AISpawns.sqf

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here, called in postInit

Author:
	Mokka
*/

if ((not LR_start) || (not (["AISpawns.sqf", "IN_GAME"] call LR_fnc_fileExists))) exitWith {};

call compile preprocessFileLineNumbers "AISpawns.sqf";
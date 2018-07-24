/*
Function: LR_fnc_fileExists

Description:
	Check if the given file exists or no.

Parameters:
	_file - The path to the file as a string

Return Values:
	True if file exists, false otherwise.

Examples:
    --- Code
	[
		"LRG_Setup.sqf"
	] call LR_fnc_fileExists;
	---

Author:
	Mokka
*/

params ["_file"];

private ["_ctrl", "_fileExists"];

disableSerialization;
_ctrl = findDisplay 0 ctrlCreate ["RscHTML", -1];
_ctrl htmlLoad _file;
_fileExists = ctrlHTMLLoaded _ctrl;
ctrlDelete _ctrl;
_fileExists
/*
Function: LR_fnc_fileExists

Description:
	Check if the given file exists or no.

Parameters:
	_file - The path to the file as a string
	_mode - The mode in which to check files (from Main Menu ("MAIN_MENU") or in-game ("IN_GAME"))

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

params ["_file", ["_mode", "MAIN_MENU"]];

private ["_ctrl", "_fileExists"];

private _display = [0, 46] select (_mode isEqualTo "IN_GAME");

disableSerialization;
_ctrl = (findDisplay _display) ctrlCreate ["RscHTML", -1];
_ctrl htmlLoad _file;
_fileExists = ctrlHTMLLoaded _ctrl;
ctrlDelete _ctrl;
_fileExists
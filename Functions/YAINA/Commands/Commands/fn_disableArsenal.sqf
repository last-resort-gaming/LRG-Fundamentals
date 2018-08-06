/*
Function: YAINA_CMD_fnc_disableArsenal

Description:
	Triggers the removal of the arsenal(s).

Parameters:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - Not used

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

EnableArsenal = false;

_msg = "Arsenal has been disabled";
_msg remoteExecCall ["systemChat", _owner];
_msg
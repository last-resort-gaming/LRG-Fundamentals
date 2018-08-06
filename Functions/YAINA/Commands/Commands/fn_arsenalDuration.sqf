/*
Function: YAINA_CMD_fnc_arsenalDuration

Description:
	Sets the duration in seconds until the arsenal is removed. Set the duration 
	to -1 to permanently enable the arsenal.

Parameters:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - The duration in seconds until the arsenal gets removed

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_duration = parseNumber _argStr;

ArsenalDuration = _duration;

_msg = format ["Duration of Arsenal has been set to %1", _duration];
_msg remoteExecCall ["systemChat", _owner];
_msg
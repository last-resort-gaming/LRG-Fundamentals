/*
Function: YAINA_CMD_fnc_safeZonePosition

Description:
	Sets the position of the safezone.

Arguments:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - x and y coordinates of the new safezone position in the format x,y

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_argStr = _argStr splitString ",";

if ((count _argStr) != 2) exitWith {};

SafeZonePosition = [parseNumber (_argStr select 0), parseNumber (_argStr select 1)];

_msg = format ["Position of SafeZone has been set to %1", _argStr];
_msg remoteExecCall ["systemChat", _owner];
_msg
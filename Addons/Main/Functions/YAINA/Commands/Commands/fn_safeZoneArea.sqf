/*
Function: YAINA_CMD_fnc_safeZoneArea

Description:
	Sets the area of the safezone.

Arguments:
	_caller - The player that called this command
    _owner - The owner of the player object that called this command
    _argStr - The area of the safezone

Return Values:
	Compiled message for internal handling

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_owner", "_caller", "_argStr"];

_area = parseNumber _argStr;

if (_area < 50 || _area > 1500) exitWith {};

safezoneArea = _area;

_msg = format ["Area of SafeZone has been set to %1", _area];
_msg remoteExecCall ["systemChat", _owner];
_msg